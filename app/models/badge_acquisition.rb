class BadgeAcquisition < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :badge

  AcquisitionError = Class.new(StandardError)
  UserAlreadyHaveBadgeError = Class.new(AcquisitionError)
  InvalidCodeError = Class.new(AcquisitionError)
  CodeNotAvailableRightNowError = Class.new(AcquisitionError)
  CodeAlreadyInUseError = Class.new(AcquisitionError)
  CodeExpirationDateExcedeedError = Class.new(AcquisitionError)
  AcquisitionCodeNeededForBadgeError = Class.new(AcquisitionError)

  def self.acquire_badge(user, badge)
    raise Badge::ExpirationDateExcedeedError.new if badge.expired?
    raise AcquisitionCodeNeededForBadgeError if badge.is_code_needed
    raise UserAlreadyHaveBadgeError.new if user.badges.include? badge

    acquire_parent_badge(user, badge)
    create(user: user, badge: badge, acquisition_date: DateTime.now).badge
  end

  def self.acquire_badge_with_code(user, code)
    raise InvalidCodeError.new unless code && badge_acq = where(code: code).first

    badge = badge_acq.badge
    raise Badge::ExpirationDateExcedeedError.new if badge.expired?

    raise CodeNotAvailableRightNowError.new if badge_acq.code_not_available?
    raise CodeAlreadyInUseError.new if badge_acq.code_used?
    raise CodeExpirationDateExcedeedError.new unless badge_acq.validate_code_expiration_date
    raise UserAlreadyHaveBadgeError.new if user.badges.include? badge
    raise AcquisitionError unless badge_acq.code_available

    acquire_parent_badge(user, badge)

    if badge_acq.code_available_for_one_use?
      create(user: user, badge: badge, acquisition_date: DateTime.now).badge
      badge_acq.update(user: user, status: BadgeCodeStatus::USED, acquisition_date: DateTime.now)
    elsif badge_acq.code_available_for_multiple_uses?
      create(user: user, badge: badge, acquisition_date: DateTime.now).badge
      create(user: user, badge: badge, code: code, status: BadgeCodeStatus::AVAILABLE_FOR_MULTIPLE_USES, acquisition_date: DateTime.now, code_expiration_date: badge_acq.code_expiration_date)
    end
    badge
  end

  def validate_code_expiration_date
    if code_expired?
      false
    elsif code_expiration_date && DateTime.now > code_expiration_date
      update(status: BadgeCodeStatus::EXPIRED)
      false
    else
      true
    end
  end

  def self.get_available_codes_for_one_use(badge)
    BadgeAcquisition.where(badge_id: badge.id).select { |badge_acq| badge_acq.code_available_for_one_use? }.map { |ba| ba.code }
  end

  def self.number_available_codes_for_one_use(badge)
    BadgeAcquisition.where(badge_id: badge.id).select { |badge_acq| badge_acq.code_available_for_one_use? }.size
  end

  def self.get_multiple_use_code(badge)
    BadgeAcquisition.where(badge_id: badge.id).select { |badge_acq| badge_acq.code_available_for_multiple_uses? }.first.code
  end

  def self.has_any_multiple_use_code?(badge)
    BadgeAcquisition.where(badge_id: badge.id).select { |badge_acq| badge_acq.code_available_for_multiple_uses? }.size > 0
  end

  def code_not_available?
    status == BadgeCodeStatus::NOT_AVAILABLE
  end

  def code_used?
    status == BadgeCodeStatus::USED
  end

  def code_expired?
    status == BadgeCodeStatus::EXPIRED
  end

  def code_available
    status == BadgeCodeStatus::AVAILABLE_FOR_ONE_USE || status == BadgeCodeStatus::AVAILABLE_FOR_MULTIPLE_USES
  end

  def code_available_for_one_use?
    status == BadgeCodeStatus::AVAILABLE_FOR_ONE_USE
  end

  def code_available_for_multiple_uses?
    status == BadgeCodeStatus::AVAILABLE_FOR_MULTIPLE_USES
  end

  private

  def self.acquire_parent_badge(user, badge)
    parent = badge.parent
    return if parent.blank?
    return if user.badges.include? parent
    return if parent.expired?
    return if parent.is_code_needed

    acquire_badge(user, parent)
  end
end

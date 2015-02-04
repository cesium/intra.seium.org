class BadgeAcquisition < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge

	UserAlreadyHaveBadgeError = Class.new(StandardError)
	InvalidCodeError = Class.new(StandardError)
	CodeNotAvailableRightNowError = Class.new(StandardError)
	CodeAlreadyInUseError = Class.new(StandardError)
	CodeExpirationDateExcedeedError = Class.new(StandardError)
	AcquisitionCodeNeededForBadgeError = Class.new(StandardError)

	def self.acquire_badge(user, badge)
		raise Badge::ExpirationDateExcedeedError.new if badge.expired? 
		raise AcquisitionCodeNeededForBadgeError if badge.is_code_needed
		raise UserAlreadyHaveBadgeError.new if user.badges.include? badge

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

		badge_acq.update(user: user, status: BadgeAcquisitionStatus::USED, acquisition_date: DateTime.now)
		badge
	end

	def validate_code_expiration_date
		if code_expired?
			false
		elsif code_expiration_date && DateTime.now > code_expiration_date
			update(status: BadgeAcquisitionStatus::EXPIRED)
			false
		else
			true
		end
	end

	def code_not_available?
		status == BadgeAcquisitionStatus::NOT_AVAILABLE
	end

	def code_used?
		status == BadgeAcquisitionStatus::USED
	end

	def code_expired?
		status == BadgeAcquisitionStatus::EXPIRED
	end
end

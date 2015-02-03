class BadgeAcquisition < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge

	UserAlreadyHaveBadge = Class.new(StandardError)
	InvalidCode = Class.new(StandardError)
	CodeNotAvailableRightNow = Class.new(StandardError)
	CodeAlreadyInUse = Class.new(StandardError)
	CodeExpirationDateExcedeed = Class.new(StandardError)

	def self.acquire_badge(user, badge, code = nil)
		raise Badge::ExpirationDateExcedeed if badge.expiration_date && DateTime.now > badge.expiration_date

		if badge.is_code_needed
			badge_acq = BadgeAcquisition.where(code: code).first
			raise InvalidCode unless code && badge_acq
			raise CodeNotAvailableRightNow unless badge_acq != BadgeAcquisitionStatus::NOT_AVAILABLE
			badge_acq.activate_badge_acquisition(user) if badge_acq.validate_badge_acquisition(code)
		else	
				self.create_badge_acquisition(user, badge)
		end
	end

	def activate_badge_acquisition(user)
		if !user.badges.include? badge
			update(user: user, status: BadgeAcquisitionStatus::USED, acquisition_date: DateTime.now)
		else
			raise UserAlreadyHaveBadge.new
		end
	end

	def validate_badge_acquisition(code)
			raise CodeAlreadyInUse if status == BadgeAcquisitionStatus::USED
			if code_expiration_date && DateTime.now > code_expiration_date
				update(status: BadgeAcquisitionStatus::EXPIRED)
				raise CodeExpirationDateExcedeed
			end
			true
	end

	private

	def self.create_badge_acquisition(user, badge)
		if !user.badges.include? badge
			BadgeAcquisition.create(user: user, badge: badge, acquisition_date: DateTime.now)
		else
			raise UserAlreadyHaveBadge.new
		end
	end
end

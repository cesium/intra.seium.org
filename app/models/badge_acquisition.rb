class BadgeAcquisition < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge

	UserAlreadyHaveBadge = Class.new(StandardError)
	InvalidCode = Class.new(StandardError)
	CodeAlreadyInUse = Class.new(StandardError)
	CodeExpirationDateExcedeed = Class.new(StandardError)

	def self.acquire_badge(user, badge, code = nil)
		raise Badge::ExpirationDateExcedeed if badge.expiration_date && DateTime.now > badge.expiration_date

		if badge.is_code_needed
			badge_acq = BadgeAcquisition.where(code: code).first
			raise InvalidCode unless code && badge_acq
			badge_acq.activate_badge_acquisition if badge_acq.validate_badge_acquisition(code)
		else	
				self.create_badge_acquisition(user, badge)
		end
	end

	private

	def self.create_badge_acquisition(user, badge)
		if !user.badges.include? badge
			BadgeAcquisition.create(user: user, badge: badge)
		else
			raise UserAlreadyHaveBadge.new
		end
	end

	def activate_badge_acquisition
		if !user.badges.include? badge
			update(user: user, status: BadgeAcquisitionStatus::USED)
		else
			raise UserAlreadyHaveBadge.new
		end
	end

	def validate_badge_acquisition(code)
			raise CodeAlreadyInUse if status == BadgeAcquisitionStatus::USED
			if code_expiration_date && DateTime.now > code_expiration_date
				update(status: BadgeStatusAcquisition::EXPIRED)
				raise CodeExpirationDateExcedeed
			end
			true
	end
end

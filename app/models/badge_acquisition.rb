class BadgeAcquisition < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge

	def self.acquire_badge(user, badge, code = nil)
		fail 'Badge Expiration Date excedeed' if badge.expiration_date && DateTime.now > badge.expiration_date
			
		if badge.is_code_needed
			ba = BadgeAcquisition.where(code: code).first
			fail 'The code does not exist' unless code && ba

			fail 'Code already in use' if ba.status == BadgeAcquisitionStatus::USED
			fail 'Code not available' if ba.status == BadgeAcquisitionStatus::NOT_AVAILABLE

			if ba.code_expiration_date && DateTime.now > ba.code_expiration_date
				fail 'Badge Code Expiration Date excedeed'
				ba.status = BadgeStatusAcquisition::EXPIRED
			else
				self.create_badge_acquisition_with_code(user, ba)
			end

		else	
				self.create_badge_acquisition(user, badge)
		end
	end

		def self.create_badge_acquisition(user, badge)
			BadgeAcquisition.create({
					badge: badge,
					user: user
			})
		end

		def self.create_badge_acquisition_with_code(user, badge_acq)
			badge_acq.user = user
			badge_acq.status = BadgeAcquisitionStatus::USED
			badge_acq.save
		end
end

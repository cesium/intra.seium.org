module BadgeHandler
	def self.register_account(user, badge)
		begin
			BadgeAcquisition.acquire_badge(user, badge)
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.update_account(user, badge)
		begin
			BadgeAcquisition.acquire_badge(user, badge) if !user.birthday.blank? && !user.biography.blank? && user.has_social_info
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end
end

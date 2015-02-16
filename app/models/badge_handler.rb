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
			BadgeAcquisition.acquire_badge(user, badge) if !user.birthday.blank? && !user.biography.blank? && user.has_social_info && !user.avatar.blank?
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.cesium_associate(user, badge)
		begin
			BadgeAcquisition.acquire_badge(user, badge) if user.is_cesium_associate
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.staff(user, badge)
		begin
			BadgeAcquisition.acquire_badge(user, badge) if user.is_organizer
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end
end

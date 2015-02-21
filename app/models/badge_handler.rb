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

	def self.attendee_14(user, badge)
		begin
			user_badges = user.badges
			BadgeAcquisition.acquire_badge(user, badge) if (BadgeHandler.user_has_badge?(user_badges, 'coderdojo_volunteer') || BadgeHandler.user_has_badge?(user_badges, 'coderdojo_Attendee') || BadgeHandler.user_has_badge?(user_badges, 'improve_volunteer') || BadgeHandler.user_has_badge?(user_badges, 'improve_attendee'))
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.attendee_16(user, badge)
		begin
			user_badges = user.badges
			BadgeAcquisition.acquire_badge(user, badge) if (BadgeHandler.user_has_badge?(user_badges, 'androidl_workshop') || BadgeHandler.user_has_badge?(user_badges, 'sessao_abertura') || BadgeHandler.user_has_badge?(user_badges, 'moedavirtual_bitreserve') || BadgeHandler.user_has_badge?(user_badges, 'helderPinto_VideoJogos'))
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.attendee_17(user, badge)
		begin
			user_badges = user.badges
			BadgeAcquisition.acquire_badge(user, badge) if (BadgeHandler.user_has_badge?(user_badges, 'palestra_unity3d') || BadgeHandler.user_has_badge?(user_badges, 'palestra_pd_agile') || BadgeHandler.user_has_badge?(user_badges, 'palestra_xamarin') || BadgeHandler.user_has_badge?(user_badges, 'palestra_meteor'))
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.attendee_18(user, badge)
		begin
			user_badges = user.badges
			BadgeAcquisition.acquire_badge(user, badge) if (BadgeHandler.user_has_badge?(user_badges, 'palestra_api') || BadgeHandler.user_has_badge?(user_badges, 'rga_participation') || BadgeHandler.user_has_badge?(user_badges, 'rga_question') || BadgeHandler.user_has_badge?(user_badges, 'run_participation') || BadgeHandler.user_has_badge?(user_badges, 'run_winner'))
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.attendee_19(user, badge)
		begin
			user_badges = user.badges
			BadgeAcquisition.acquire_badge(user, badge) if (BadgeHandler.user_has_badge?(user_badges, 'workshop_swift') || BadgeHandler.user_has_badge?(user_badges, 'palestra_devops') || BadgeHandler.user_has_badge?(user_badges, 'quiz_attendee') || BadgeHandler.user_has_badge?(user_badges, 'quiz_winner') || BadgeHandler.user_has_badge?(user_badges, 'workshop_modelacao3d') || BadgeHandler.user_has_badge?(user_badges, 'workshop_impressao3d') || BadgeHandler.user_has_badge?(user_badges, 'palestra_bdd'))
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	def self.attendee_20(user, badge)
		begin
			user_badges = user.badges
			BadgeAcquisition.acquire_badge(user, badge) if (BadgeHandler.user_has_badge?(user_badges, 'workshop_htmlcss') || BadgeHandler.user_has_badge?(user_badges, 'palestra_user_experience') || BadgeHandler.user_has_badge?(user_badges, 'workshop_python_web2py') || BadgeHandler.user_has_badge?(user_badges, 'workshop_drones') || BadgeHandler.user_has_badge?(user_badges, 'workshop_arduino') || BadgeHandler.user_has_badge?(user_badges, 'attendee_dinner'))
		rescue BadgeAcquisition::AcquisitionError => e
			puts e
		end
	end

	private

	def self.user_has_badge?(user_badges, codename)
		badge = Badge.find_by_codename(codename)
		if badge
			user_badges.include? badge
		else
			false
		end
	end
end

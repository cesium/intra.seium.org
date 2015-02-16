namespace :sei do
	desc "Add Badges"

	task :add_badges, [:path]  => :environment  do |t, args|
		raise ArgumentError.new if args.path.blank?

		require "./#{args.path}"

		RakeBadgeCreation.badges.each do |badge|

			if !badge[:name].blank? && !badge[:codename].blank? && !badge[:badge_type].blank? && !badge[:logo_url].blank? && !badge[:edition_id].blank?
				if !Badge.find_by_codename(badge[:codename])
					if badge[:badge_type] == BadgeType::CODE_NEEDED
						badge[:is_code_needed] = true
						Badge.create(badge)
						puts "[LOG] Created badge: #{badge[:codename]}"
					elsif badge[:badge_type] == BadgeType::USER_ACCOUNT
						badge[:is_code_needed] = false
						Badge.create(badge)
						puts "[LOG] Created badge: #{badge[:codename]}"
					else
						puts "[ERROR] Invalid Badge type: #{badge[:badge_type]}"
					end
				else
					puts "[ERROR] Already exists a badge with codename: #{badge[:codename]}"
				end
			else
					puts "[ERROR] Missings fields for badge: #{badge[:codename]}"
			end

		end

	end
end

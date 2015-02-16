namespace :sei do
	desc "Add Badges"
	task :create_badges, [:path]  => :environment  do |t, args|
		raise ArgumentError.new if args.path.blank?

		require "#{args.path}"

		new_badges.each do |badge|

			if !badge.name.blank? && !badge.codename.blank? && !badge.badge_type.blank? && !badge.is_code_needed.blank? && !badge.logo_url.blank? && !badge.edition_id.blank?
				raise StandardException, "ERROR: Badge already exists with the same codename" if Badge.find_by_codename(badge.codename)
				badge.save!
			end
		end
	end
end

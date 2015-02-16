namespace :sei do
	desc "Add Badges"
	task :create_badges, [:path]  => :environment  do |t, args|
		raise ArgumentError.new if args.path.blank?

		require "#{args.path}"

		new_badges.each do |badge|

			raise StandardException, "ERROR: Badge already exists with the same codename" if Badge.find_by_codename(badge.codename)

			badge.save!
		end
	end
end

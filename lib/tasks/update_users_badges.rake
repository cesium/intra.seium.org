namespace :sei do
	desc "Update User Badges"

	task :update_users_badges, [:path]  => :environment  do |t|

		User.all.each do |user|
			user.save!
		end

	end
end

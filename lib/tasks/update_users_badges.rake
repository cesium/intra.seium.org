namespace :sei do
	desc "Update User Badges"

	task :update_users_badges, [:path]  => :environment  do |t|

		User.all.each do |user|
			if user.valid?
				user.save!
			else
				puts "[ERROR] USER #{user.username} IS INVALID"
			end
		end

	end
end

namespace :sei do
  desc "Removes duplicated badge from user"

  task :destroy_duplicated_badge, [:username] => :environment do |t, args|
    user = User.find_by(username: args[:username])
    acquisition = user.badges.uniq
    acquisition.each do |badge|
      badges_list = BadgeAcquisition.where(badge_id: badge, user_id: user)
      if badges_list.length > 1
        badges_list[1..-1].each do |badge|
          BadgeAcquisition.destroy(badge.id)
        end
      end
    end
  end
end

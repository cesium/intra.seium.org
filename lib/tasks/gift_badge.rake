namespace :sei do
  desc "Gift badge to a user"

  task :gift_badge, [:badge, :username] => :environment do |t, args|
    badge_id = Badge.find_by(codename: args[:badge]).id
    user_id = User.find_by(username: args[:username]).id
    unless BadgeAcquisition.where(badge_id: badge_id, user_id: user_id)
      BadgeAcquisition.create!(badge_id: badge_id, user_id: user_id, acquisition_date: Time.now)
    end
  end
end

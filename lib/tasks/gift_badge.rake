namespace :sei do
  desc "Gift badge to a user"

  task :gift_badge, [:badge_codename, :username] => :environment do |t, args|
    badge_id = Badge.find_by(codename: args[:badge_codename]).id
    user_id  = User.find_by(username: args[:username]).id
    BadgeAcquisition.create!(badge_id: badge_id, user_id: user_id, acquisition_date: Time.now)
  end
end

namespace :sei do
  desc "Gift badge to a user by email"

  task :gift_badge_email, [:badge, :email] => :environment do |t, args|
    badge_id  = Badge.find_by(codename: args[:badge]).id
    user_id   = User.find_by(email: args[:email]).id
    BadgeAcquisition.create!(badge_id: badge_id, user_id: user_id, acquisition_date: Time.now)
  end
end

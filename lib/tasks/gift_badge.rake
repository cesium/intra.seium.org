namespace :sei do
  desc "Gift badge to a user"

  task :gift_badge, [:badge] => :environment do |t, args|
    badge_id = Badge.find_by(codename: args[:badge]).id
    args.extras.each do |u|
      user_id = User.find_by(username: u).id
      BadgeAcquisition.create!(badge_id: badge_id, user_id: user_id, acquisition_date: Time.now)
    end
  end
end

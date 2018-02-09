namespace :sei do
  desc "give an array of usernames times the number of badges of the users with atleast 10 badges"

  task :get_winners => :environment do |t, args|
      puts User.all.select{|b| b.badges.count >= 10 and !b.is_organizer}
        .map{|u| Array.new(u.badges.count,u.email)}.flatten.shuffle
  end
end

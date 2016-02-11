namespace :sei do
  desc "Reset every badge counter"

  task :reset_counters => :environment do |t, args|
    User.find_each { |u| User.reset_counters u.id, :badge_acquisitions }
  end
end

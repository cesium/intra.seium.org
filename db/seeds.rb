Dir[File.dirname(__FILE__) + "/seeds_files/*"].each { |file| require_relative file }

# Editions
editions = Seed::editions

# Companies
companies = Seed::companies(editions)

# Speakers
speakers = Seed::speakers(editions, companies)

# Activities
# activities = Seed::activities(editions, speakers)
activities = []

Seed::users

# Badges
badges = RakeBadgeCreation::badges

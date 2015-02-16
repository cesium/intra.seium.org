require './db/seeds_files/editions'
require './db/seeds_files/companies'
require './db/seeds_files/speakers'
require './db/seeds_files/activities'
require './db/seeds_files/badges'

# Editions
editions = Seed::editions

# Companies
companies = Seed::companies(editions)

# Speakers
speakers = Seed::speakers(editions, companies)

# Activities
activities = Seed::activities(editions, speakers)

# Badges
badges = Seed::badges(editions, activities)

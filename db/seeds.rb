require './db/seeds_files/editions'
require './db/seeds_files/companies'
require './db/seeds_files/speakers'
require './db/seeds_files/activities'
require './db/seeds_files/users'
require './db/seeds_files/badges'

# Editions
editions = Seed::editions

# Companies
companies = Seed::companies(editions)

# Speakers
speakers = Seed::speakers(editions, companies)

# Activities
activities = Seed::activities(editions, speakers)

# Users
users = Seed::users(editions, activities)

# Codes Generation for Badges
badges = Seed::badges(users)

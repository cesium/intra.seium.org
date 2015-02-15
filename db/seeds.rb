require './db/seeds_files/editions'
require './db/seeds_files/companies'
require './db/seeds_files/speakers'
require './db/seeds_files/activities'
require './db/seeds_files/staff'
require './db/seeds_files/users'
require './db/seeds_files/badges'
require './db/seeds_files/badge_acquisitions'

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

# Staff
staff = Seed::staff(editions, activities)

# Users
users = Seed::users(editions, activities)

# Badges Acquisition
#badge_acquisitions = Seed::badge_acquisitions(users, badges)

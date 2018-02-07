source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.2.10"
# Use postgresql as the database for Active Record
gem "pg", "~> 0.15"

# Use SLIM instead of HTML
gem "slim-rails"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
gem "bootstrap-sass", "~> 3.3.3"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.1.0"

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem "spring",        group: :development

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use devise for User authentication
gem "devise"
gem "omniauth-github"
gem "omniauth-google-oauth2"

# Use CouponCode for Generating Codes for Badges
gem "coupon_code"

# Use font-awesome for glyphicons
gem "font-awesome-sass"

# Paperclip for image management
gem "paperclip", "5.2.1"

# Amazon AWS SDK
gem "aws-sdk", "~> 2"

# Gem for generate qrcodes
gem "rqrcode_png"

gem "cancancan", "~> 1.10"

# Production logging
# Remove when update to Rails 5
gem "rails_12factor", group: :production

# deployment gems
gem "puma", "~> 3.11"

# Model Diagram Generation tool
group :development, :test do
  gem "railroady"
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
end

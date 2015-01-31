class Edition < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :speakers
	has_many :activities
	has_and_belongs_to_many :companies
end

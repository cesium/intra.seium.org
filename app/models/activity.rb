class Activity < ActiveRecord::Base
	has_and_belongs_to_many :speakers
	has_and_belongs_to_many :users
end

class Company < ActiveRecord::Base
	has_many :speakers
	has_and_belongs_to_many :editions
end

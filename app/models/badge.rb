class Badge < ActiveRecord::Base
  belongs_to :edition
  belongs_to :activity
	has_many :badge_codes

	def users
		BadgeCode.where(badge_id: id).map { |bc| bc.user }
	end
end

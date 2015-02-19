class Badge < ActiveRecord::Base
	belongs_to :edition
  belongs_to :activity

	BadgeNotFoundError = Class.new(StandardError)
	CodesNotAllowedError = Class.new(StandardError)
	ExpirationDateExcedeedError = Class.new(StandardError)

	has_many :badge_acquisitions
	has_many :users, through: :badge_acquisitions

	# def users
	# 	BadgeAcquisition.where(badge_id: id).map { |bc| bc.user }.select { |u| u }
	# end

	def generate_codes(num_codes, status, code_expiration_date = nil)
		if is_code_needed
			(1..num_codes).each do
				code = CouponCode.generate(parts: 2) until code && BadgeAcquisition.where(code: code).empty?
				BadgeAcquisition.create(
					badge: self,
					code: code,
					status: status,
					code_expiration_date: code_expiration_date
				)
			end
		else
			raise CodesNotAllowedError.new
		end
	end

	def expired?
		expiration_date && DateTime.now > expiration_date
	end
end

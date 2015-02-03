class Badge < ActiveRecord::Base
	belongs_to :edition
  belongs_to :activity

	CodesNotAllowedError = Class.new(StandardError)
	ExpirationDateExcedeed = Class.new(StandardError)

	def users
		BadgeAcquisition.where(badge_id: id).map { |bc| bc.user }.select { |u| u }
	end

	def generate_codes(num_codes, status = BadgeAcquisitionStatus::AVAILABLE, code_expiration_date = nil)
		if is_code_needed
			(1..num_codes).each do
				code = CouponCode.generate until code && BadgeAcquisition.where(code: code).empty?
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
end

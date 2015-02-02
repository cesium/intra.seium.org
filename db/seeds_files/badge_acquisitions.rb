module Seed
	def self.badge_acquisitions(users, badges)
		BadgeAcquisition.create([
			{
				badge: badges[0],
				user: users[0],
			},
			{
				badge: badges[1],
				user: users[0],
			},
			{
				badge: badges[2],
				user: users[0],
				code: CouponCode.generate,
				status: BadgeAcquisitionStatus::USED,
				code_expiration_date: DateTime.civil_from_format(:local, 2016)	
			},
			{
				badge: badges[2],
				code: CouponCode.generate,
				status: BadgeAcquisitionStatus::AVAILABLE,
				code_expiration_date: DateTime.civil_from_format(:local, 2016)	
			}
		])
	end
end

module Seed
	def self.badge_codes(users, badges)
		BadgeCode.create([
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
				status: BadgeCodeStatus::USED,
				code_expiration_date: DateTime.civil_from_format(:local, 2016)	
			},
			{
				badge: badges[2],
				code: CouponCode.generate,
				status: BadgeCodeStatus::AVAILABLE,
				code_expiration_date: DateTime.civil_from_format(:local, 2016)	
			}
		])
	end
end

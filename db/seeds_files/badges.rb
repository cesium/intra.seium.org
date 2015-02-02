module Seed
	def self.badges(users)
		BadgeCode.create([
			{
				badge_id: 1,
				user: users[0],
				code: CouponCode.generate,
				status: BadgeCodeStatus::AVAILABLE,
				expiration_date: DateTime.civil_from_format(:local, 2016)	
			},
			{
				badge_id: 1,
				code: CouponCode.generate,
				status: BadgeCodeStatus::AVAILABLE,
				expiration_date: DateTime.civil_from_format(:local, 2016)	
			}
		])
	end
end

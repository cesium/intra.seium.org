module Seed
	def self.badge_acquisitions(users, badges)
		BadgeAcquisition.create([
			{
				badge: badges[0],
				user: users[0],
				acquisition_date: DateTime.now
			}
		])
	end
end

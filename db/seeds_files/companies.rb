module Seed
	def self.companies(editions)
		Company.create!([
			{
				name: 'Blizzard',
				is_partner: false,
				editions: editions
			},
			{
				name: 'BEEVERYCREATIVE',
				description: '3D Printing',
				is_partner: true,
				partnership_type: PartnershipType::SPONSOR,
				web_site: 'https://beeverycreative.com/',
				editions: editions
			}
		])
	end
end

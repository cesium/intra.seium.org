module Seed
	def self.companies(editions)
		Company.create!([
			{
				name: "BloomIdea",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_SPONSOR,
				web_site: "http://bloomidea.com/",
				editions: [editions[0]]
			},
			{
				name: "Eurotux",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_SPONSOR,
				web_site: "http://eurotux.com/",
				editions: [editions[0]]
			},
			{
				name: "Vilt",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_SPONSOR,
				web_site: "http://www.vilt-group.com",
				editions: [editions[0]]
			},
			{
				name: "Bitreserve",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_SPONSOR,
				web_site: "https://bitreserve.org/",
				editions: [editions[0]]
			},
			{
				name: "Seegno",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_SPONSOR,
				web_site: "http://seegno.com/",
				editions: [editions[0]]
			},
			{
				name: "WeDo",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::SPONSOR,
				web_site: "http://www.wedotechnologies.com/pt/",
				editions: [editions[0]]
			},
			{
				name: "iMobileMagic",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::SPONSOR,
				web_site: "http://www.imobilemagic.com/",
				editions: [editions[0]]
			},
			{
				name: "Microsoft",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_PARTNER,
				web_site: "https://www.microsoft.com",
				editions: [editions[0]]
			},
			{
				name: "Group Buddies",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_PARTNER,
				web_site: "https://groupbuddies.com/",
				editions: [editions[0]]
			},
			{
				name: "KEEP SOLUTIONS",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::MAIN_PARTNER,
				web_site: "http://www.keep.pt/",
				editions: [editions[0]]
			},
			{
				name: "Storyo",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://storyoapp.com/",
				editions: [editions[0]]
			},
			{
				name: "Blip",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://www.blip.pt/",
				editions: [editions[0]]
			},
			{
				name: "Bee Very Creative",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "https://beeverycreative.com/",
				editions: [editions[0]]
			},
			{
				name: "Inmotion",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://www.inmotion.pt/",
				editions: [editions[0]]
			},
			{
				name: "FPV",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://fpvportugal.com/",
				editions: [editions[0]]
			},
			{
				name: "Novo Banco",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://www.novobanco.pt/",
				editions: [editions[0]]
			},
			{
				name: "Startup Braga",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://www.investbraga.com/startup/",
				editions: [editions[0]]
			},
			{
				name: "Allkits",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://www.allkits.pt/",
				editions: [editions[0]]
			},
			{
				name: "Red Bull",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "http://www.redbull.com/pt/pt",
				editions: [editions[0]]
			},
			{
				name: "Tasquinha Bracarense",
				description: nil,
				is_partner: true,
				partnership_type: PartnershipType::PARTNER,
				web_site: "https://www.facebook.com/tasquinhabracarensepagina",
				editions: [editions[0]]
			},
			{
				name: "Blizzard",
				description: nil,
				is_partner: false,
				partnership_type: nil,
				web_site: "http://eu.blizzard.com/",
				editions: [editions[0]]
			},
			{
				name: "X-Team",
				description: nil,
				is_partner: false,
				partnership_type: nil,
				web_site: "http://x-team.com/",
				editions: [editions[0]]
			},
			{
				name: "Tricubo,",
				description: nil,
				is_partner: false,
				partnership_type: nil,
				web_site: "https://tricubo.com/",
				editions: [editions[0]]
			},
			{
				name: "Chique,",
				description: nil,
				is_partner: false,
				partnership_type: nil,
				web_site: "https://chique.pt/",
				editions: [editions[0]]
			},
			{
				name: "TYMR,",
				description: nil,
				is_partner: false,
				partnership_type: nil,
				web_site: "https://tymr.com/",
				editions: [editions[0]]
			},
			{
				name: "Venture FC",
				description: nil,
				is_partner: false,
				partnership_type: nil,
				web_site: "https://venturefc.co/",
				editions: [editions[0]]
			}
		])
	end
end

module Seed
	def self.badges(editions, activities)
		Badge.create!([
			{
				name: "register",
				codename: "register_account",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Registo na Plataforma Online da Semana de Engenharia Informática @ UM",
				is_code_needed: false,
				category: 'main',
				logo_url: 'http://www.pimall.com/nais/images/badge_m133.jpg',
				edition: editions[0]
			},
			{
				name: "update-account",
				codename: "update_account",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Atualização dos dados da conta",
				is_code_needed: false,
				category: 'main',
				logo_url: 'http://www.vectorgraphit.com/wp-content/uploads/2013/09/vintage_badge.jpg',
				edition: editions[0]
			},
			{
				name: "organizer",
				codename: "is_organizer",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Membro faz parte da organização da SEI!",
				is_code_needed: false,
				category: 'main',
				logo_url: 'http://rlv.zcache.co.uk/trust_me_im_an_event_organizer_badge-rae454b00e45a4b708cc198f99fa59ed4_x7j12_8byvr_324.jpg',
				edition: editions[0]
			},
			{
				name: "explorer",
				codename: "explorer",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Até o Sherlock Holmes ficaria surpreso!",
				is_code_needed: true,
				category: 'main',
				logo_url: 'http://badgeunlock.com/wp-content/uploads/2010/10/Campus-Explorer1.png',
				edition: editions[0]
			},
			{
				name: "swift-master",
				codename: "swift_master",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Guru da nova linguagem da Apple!",
				is_code_needed: true,
				category: 'main',
				logo_url: 'http://www.wired.com/wp-content/uploads/2014/07/Apple_Swift_Logo.png',
				edition: editions[0]
			},
			{
				name: "javascript-master",
				codename: "javascript-master",
				badge_type: BadgeType::CODE_NEEDED,
				description: "ES6 ftw!",
				is_code_needed: true,
				category: 'main',
				logo_url: 'http://www.javatpoint.com/images/javascript/javascript_logo.png',
				edition: editions[0]
			}
		])
	end
end

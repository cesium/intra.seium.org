module RakeBadgeCreation
	def self.new_badges(editions, activities)
		Badge.create!([
      {
				name: "Amigo da Blip",
				codename: "blip_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/blip.png',
				edition_id: 2016,
        is_code_needed: true
			},
			{
				name: "Amigo da BloomIdea",
				codename: "bloomidea_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/bloomidea.png',
				edition_id: 2016
			},
      {
				name: "Amigo da Eurotux",
				codename: "eurotux_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/eurotux.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Amigo da Farfetch",
				codename: "farfetch_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/farfetch.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Amigo da OutSystems",
				codename: "outsystems_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/outsystems.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Amigo da Seegno",
				codename: "seegno_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/seegno.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Amigo da Subvisual",
				codename: "subvisual_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/enterprises/subvisual.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Levantar Kit",
				codename: "unwrap_kit",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/random/kit.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Acordar cedo",
				codename: "early_bird",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/random/early_bird.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Participação na palestra sobre BITalino",
				codename: "bitalino",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/activities/monday/bitalino.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Eu arranjei um Mac, iSwift",
				codename: "swift",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/activities/monday/swift.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Wannabe Empreendedor",
				codename: "entrepreneur_celso",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/activities/monday/entrepreneur.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Começar com o pé direito",
				codename: "opening_ceremony",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/activities/monday/opening_ceremony.png',
        is_code_needed: true,
				edition_id: 2016
			},
      {
				name: "Participação em workshop de React e Redux",
				codename: "react_redux",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/16/activities/monday/react_redux.png',
        is_code_needed: true,
				edition_id: 2016
			}
		])
	end
end

module RakeBadgeCreation
    def self.badges
        Badge.create!([
            {
                name: "Banca Blip",
                codename: "banca_blip",
                description: "Esteve na banca da Blip",
                badge_type: BadgeType::CODE_NEEDED,
                logo_url: '/images/badges/16/enterprises/banca_blip.png',
                is_code_needed: true,
                edition_id: 2017
            },
            {
                name: "Banca Farfetch",
                codename: "banca_farfetch",
                description: "Esteve na banca da Farfetch",
                badge_type: BadgeType::CODE_NEEDED,
                logo_url: '/images/badges/16/enterprises/banca_farfetch.png',
                is_code_needed: true,
                edition_id: 2017
            },
            {
                name: "Banca OutSystems",
                codename: "banca_outsystems",
                description: "Esteve na banca da OutSystems",
                badge_type: BadgeType::CODE_NEEDED,
                logo_url: '/images/badges/16/enterprises/banca_outsystems.png',
                is_code_needed: true,
                edition_id: 2017
            }
        ])
    end
end

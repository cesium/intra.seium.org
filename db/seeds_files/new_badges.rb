module RakeBadgeCreation
	def self.badges
		[
			{
				name: "Conheci o Hélder Pinto",
				codename: "helder_pinto",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/participacao/16/conheci_helder_pinto.jpg',
				edition_id: 2015
			},
			{
				name: "Amigo da Keep Solutions",
				codename: "keepsolutions_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/keepsolutions_buddy.png',
				edition_id: 2015
			},
			{
				name: "Participação na Palestra de Unity 3D",
				codename: "palestra_unity3d",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/palestra_unity3d.png',
				edition_id: 2015
			},
			{
				name: "Participação na Palestra de Product Development & Agile",
				codename: "palestra_pd_agile",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/palestra_pd_agile.png',
				edition_id: 2015
			},
			{
				name: "Participação na Palestra de Xamarin",
				codename: "palestra_xamarin",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/palestra_xamarin.png',
				edition_id: 2015
			},
			{
				name: "Participação na Palestra de Meteor",
				codename: "palestra_meteor",
				badge_type: BadgeType::CODE_NEEDED,
				logo_url: '/images/badges/palestra_meteor.png',
				edition_id: 2015
			}
		]
	end
end

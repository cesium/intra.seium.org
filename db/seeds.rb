# Editions
editions = Edition.create([
	{
		name: "I Semana de Engenharia Informática na Universidade do Minho",
		edition_number: 1,
		description: 'A já conhecida "Semana da LEI" dá este ano pela primeira vez lugar à SEI - Semana da Engenharia Informática da Universidade do Minho. A SEI é uma semana totalmente organizada por alunos para os alunos. É gratuita e irá decorrer entre os dias 15 e 21 de Fevereiro.',
		begin_date: DateTime.civil_from_format(:local, 2015, 2, 15),
		end_date: DateTime.civil_from_format(:local, 2015, 2, 21)
	}
])

# Companies
companies = Company.create([
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

# Speakers
speakers = Speaker.create([
	{
		name: 'Hélder Pinto',
		role: '3D Evironment Artist',
		biography: 'Começou carreira profissional na indústria dos vídeo jogos em terras Lusitanas na Seed Studios, no ano de 2007, onde trabalhou no jogo Under Siege Game, partindo depois para a Alemanha, onde ajudou a embelezar os ambientes de Crysis 2 e 3 antes de finalmente começar na Blizzard na Califórnia onde de momento trabalha no jogo Overwatch.',
		twitter_account: 'https://twitter.com/HelderHP',
		company: companies[0],
		editions: editions
	},
	{
		name: 'Francisco Mendes',
		role: 'Entrepreneur & Creator',
		biography: 'Empreendedor apaixonado por tecnologia. Licenciado em Engenharia Electrónica e Telecomunicações e pós-graduado em Engenharia de Automação Industrial, ambos pela Universidade de Aveiro, começou a sua carreira profissional como Engenheiro de I&D e posteriormente como director de Hardware. No final de 2010, juntou-se a Jorge Pinto e fundaram a bitBOX Electronic Systems, uma startup que começou na incubadora de empresas da Universidade de Aveiro e que mais tarde se tornou na BEEVERYCREATIVE, a empresa que criou a primeira impressora 3D portuguesa.',
		twitter_account: 'https://twitter.com/fmendes75/',
		company: companies[1],
		editions: editions
	}
])

# Activities
activities = Activity.create([
	{
		name: 'Vídeo Jogos Além-Fronteiras',
		description: 'Palestra de discussão do estado atual em desenvolvimento de vídeojogos.',
		begin_date: DateTime.civil_from_format(:local, 2015, 2, 17, 9),
		end_date: DateTime.civil_from_format(:local, 2015, 2, 17, 11),
		activity_type: ActivityType::TALK,
		place: 'Anfiteatro A2 @ DI',
		num_available_places: 60,
		speakers: [speakers[0]],
		edition: editions[0]
	},
	{
		name: 'Modelação 3D',
		description: 'Workshop de introdução à arte de modelação de objetos a três dimensões.',
		begin_date: DateTime.civil_from_format(:local, 2015, 2, 19, 14),
		end_date: DateTime.civil_from_format(:local, 2015, 2, 19, 15),
		activity_type: ActivityType::WORKSHOP,
		place: 'Anfiteatro A2 @ DI',
		num_available_places: 40,
		speakers: [speakers[1]],
		edition: editions[0]
	}
])

# Users
users = User.create([
	{
		email: 'foo@foo.foo',
		password: '123456789',
		first_name: 'José',
		last_name: 'Alvim',
		birthday: DateTime.civil_from_format(:local, 1990, 4, 18),
		is_student: true,
		is_student_at_minho_univ: true,
		minho_univ_student_id: 'pg123456',
		is_inf_eng_student_at_minho_univ: true,
		is_cesium_associate: true,
		cesium_associate_number: 1043,
		is_organizer: true,
		organizer_role: 'Membro',
		activities: activities,
		editions: editions
	}
])

# Codes Generation for Badges
badges_codes = BadgeCode.create([
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

# Badges Acquisition
users[0].add_badge(1)

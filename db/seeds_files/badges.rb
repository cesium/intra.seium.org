module Seed
	def self.badges(editions, activities)
		Badge.create!([
			{
				name: "Sócio do CeSIUM",
				codename: "cesium_associate",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Membro da comunidade do CeSIUM",
				is_code_needed: false,
				category: 'main',
				logo_url: '/images/badges/cesium/Socio.png',
				edition: editions[0]
			},
			{
				name: "Amigo da Bitreserve",
				codename: "bitreserve_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Buddy of Bitreserve",
				is_code_needed: true,
				category: 'buddy',
				logo_url: '/images/badges/empresas/Bitreserve.png',
				edition: editions[0]
			},
			{
				name: "Amigo do Novo Banco",
				codename: "novobanco_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Buddy of Novo Banco",
				is_code_needed: true,
				category: 'buddy',
				logo_url: '/images/badges/empresas/NBB.png',
				edition: editions[0]
			},
			{
				name: "Cliente do Novo Banco",
				codename: "novobanco_client",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Client of Novo Banco",
				is_code_needed: true,
				category: 'client',
				logo_url: '/images/badges/empresas/NBC.png',
				edition: editions[0]
			},
			{
				name: "Cliente da Tasquinha Bracarense",
				codename: "tasquinha_Client",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Client of Tasquinha Bracarense",
				is_code_needed: true,
				category: 'client',
				logo_url: '/images/badges/empresas/Tasquinha.png',
				edition: editions[0]
			},
			{
				name: "Voluntário no CoderDojo Minho",
				codename: "coderdojo_volunteer",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Guia da próxima geração!",
				is_code_needed: true,
				category: '',
				logo_url: '/images/badges/participacao/14/CoderdojoVolunteer.png',
				edition: editions[0]
			},
			{
				name: "Participante no CoderDojo Minho",
				codename: "coderdojo_Attendee",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Preparar o meu futuro!",
				is_code_needed: true,
				category: 'attendee',
				logo_url: '/images/badges/participacao/14/CoderdojoV.png',
				edition: editions[0]
			},
			{
				name: "Voluntário no Improve Braga",
				codename: "improve_volunteer",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Ajudar a melhorar Braga",
				is_code_needed: true,
				category: 'volunteer',
				logo_url: '/images/badges/participacao/14/ImproveVolunteer.png',
				edition: editions[0]
			},
			{
				name: "Participante no Improve Braga",
				codename: "improve_attendee",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Melhorar Braga!",
				is_code_needed: true,
				category: 'attendee',
				logo_url: '/images/badges/participacao/14/ImproveAttendee.png',
				edition: editions[0]
			},
			{
				name: "Participação no dia 14",
				codename: "attendee_14",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Dia 14 - Check!",
				is_code_needed: false,
				category: 'attendee',
				logo_url: '/images/badges/participacao/14/Participacao.png',
				edition: editions[0]
			},
			{
				name: "Voluntário no dia 14",
				codename: "volunteer_14",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Voluntário Dia 14 - Check!",
				is_code_needed: true,
				category: 'volunteer',
				logo_url: '/images/badges/participacao/14/Participacao.png',
				edition: editions[0]
			},
			{
				name: "Participação no Workshop de Android L",
				codename: "androidl_workshop",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Workshop Android L - BloomIdea",
				is_code_needed: true,
				category: 'attendee',
				logo_url: '/images/badges/participacao/16/AndroidL.png',
				edition: editions[0]
			},
			{
				name: "Participação na Palestra de Vídeo Jogos",
				codename: "helderPinto_VideoJogos",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Palestra Video Jogos Além-Fronteiras - Hélder Pinto",
				is_code_needed: true,
				category: 'attendee',
				logo_url: '/images/badges/participacao/16/HelderPinto.png',
				edition: editions[0]
			},
			{
				name: "Participação na Palestra da  Moeda Virtual",
				codename: "moedavirtual_bitreserve",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Palestra Moeda Virtual - BitReserve",
				is_code_needed: true,
				category: 'attendee',
				logo_url: '/images/badges/participacao/16/MoedaVirtual.png',
				edition: editions[0]
			},
			{
				name: "Amigo da Seegno",
				codename: "seegno_buddy",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Buddy of Seegno",
				is_code_needed: true,
				category: 'buddy',
				logo_url: '/images/badges/participacao/16/Seegno.png',
				edition: editions[0]
			},
			{
				name: "Participação no dia 16",
				codename: "attendee_16",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Dia 16 - Check!",
				is_code_needed: false,
				category: 'attendee',
				logo_url: '/images/badges/participacao/16/Participacao.png',
				edition: editions[0]
			},
			{
				name: "Voluntário no dia 16",
				codename: "volunteer_16",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Voluntário Dia 16 - Check!",
				is_code_needed: true,
				category: 'volunteer',
				logo_url: '/images/badges/participacao/16/Participacao.png',
				edition: editions[0]
			},
			{
				name: "Participação na Sessão de Abertura",
				codename: "sessao_abertura",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Bem-vinda, SEI!",
				is_code_needed: true,
				category: 'attendee',
				logo_url: '/images/badges/participacao/16/SessaoAbertura.png',
				edition: editions[0]
			},
			{
				name: "Aquisição do Kit de Participante",
				codename: "kit",
				badge_type: BadgeType::CODE_NEEDED,
				description: "Kit - Check!",
				is_code_needed: true,
				category: 'main',
				logo_url: '/images/badges/sei/Kit.png',
				edition: editions[0]
			},
			{
				name: "Membro da Organização da SEI",
				codename: "staff",
				badge_type: BadgeType::USER_ACCOUNT,
				description: "Staff SEI",
				is_code_needed: false,
				category: 'main',
				logo_url: '/images/badges/sei/Organizacao.png',
				edition: editions[0]
			}
		])
	end
end

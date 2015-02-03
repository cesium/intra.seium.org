module Seed
	def self.badges(editions, activities)
		Badge.create([
			{
				name: "register",
				description: "Registo na Plataforma Online da Semana de Engenharia Informática @ UM",
				is_code_needed: false,
				category: 'main',
				logo_url: 'http://www.pimall.com/nais/images/badge_m133.jpg',
				edition: editions[0]
			},
			{
				name: "update-account",
				description: "Atualização dos dados da conta",
				is_code_needed: false,
				category: 'main',
				logo_url: 'http://www.vectorgraphit.com/wp-content/uploads/2013/09/vintage_badge.jpg',
				edition: editions[0]
			},
			{
				name: "explorer",
				description: "Até o Sherlock Holmes ficaria surpreso!",
				is_code_needed: true,
				category: 'main',
				logo_url: 'http://badgeunlock.com/wp-content/uploads/2010/10/Campus-Explorer1.png',
				edition: editions[0]
			},
			{
				name: "swift-master",
				description: "Guru da nova linguagem da Apple!",
				is_code_needed: true,
				category: 'main',
				logo_url: 'http://www.wired.com/wp-content/uploads/2014/07/Apple_Swift_Logo.png',
				edition: editions[0]
			},
			{
				name: "javascript-master",
				description: "ES6 ftw!",
				is_code_needed: true,
				category: 'main',
				logo_url: 'http://www.javatpoint.com/images/javascript/javascript_logo.png',
				edition: editions[0]
			}
		])
	end
end

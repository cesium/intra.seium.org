module Seed
	def self.badges(editions, activities)
		Badge.create([
			{
				name: "register",
				description: "Registo na Plataforma Online da Semana de Engenharia Informática @ UM",
				category: 'main',
				logo_url: 'http://www.pimall.com/nais/images/badge_m133.jpg',
				edition: editions[0]
			},
			{
				name: "update-account",
				description: "Atualização dos dados da conta",
				category: 'main',
				logo_url: 'http://www.vectorgraphit.com/wp-content/uploads/2013/09/vintage_badge.jpg',
				edition: editions[0]
			}
		])
	end
end

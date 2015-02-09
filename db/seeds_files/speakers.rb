module Seed
	def self.speakers(editions, companies)
		Speaker.create!([
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
	end
end

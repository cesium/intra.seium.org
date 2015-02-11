module Seed
	def self.speakers(editions, companies)
		Speaker.create!([
			{
				name: "Hélder Pinto",
				role: "3D Environment Artist",
				biography: "Começou carreira profissional na indústria dos vídeo jogos em terras Lusitanas na Seed Studios, no ano de 2007, onde trabalhou no jogo Under Siege Game, partindo depois para a Alemanha, onde ajudou a embelezar os ambientes de Crysis 2 e 3 antes de finalmente começar na Blizzard na Califórnia onde de momento trabalha no jogo Overwatch.",
				photo_url: "img/speakers/hpinto.jpg",
				web_site: "http://www.helderpinto.com/",
				twitter_account: "https://twitter.com/HelderHP",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Luís Fonseca",
				role: "Lead Interactive Developer",
				biography: "Com mais de uma década de experiência num leque muito variado de tecnologias, desde Unity a Objective-C passando pelo Javascript e Flash, focou-se fortemente, nos últimos anos, em desenvolvimento de jogos e aplicações mobile. Faz parte da X-Team desde 2008 onde trabalha, em parceria, para empresas como RIOT Games, Dreamworks, FOX Broadcasting, Microsoft, etc., criando projectos que alcançam todos os dias milhões de utilizadores.",
				photo_url: "img/speakers/lfonseca.jpg",
				web_site: "http://luispedrofonseca.com/",
				twitter_account: "https://twitter.com/lpfonseca",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Francisco Mendes",
				role: "Entrepreneur & Creator",
				biography: "Empreendedor apaixonado por tecnologia. Licenciado em Engenharia Electrónica e Telecomunicações e pós-graduado em Engenharia de Automação Industrial, ambos pela Universidade de Aveiro, começou a sua carreira profissional como Engenheiro de I&D e posteriormente como diretor de Hardware. No final de 2010, juntou-se a Jorge Pinto e fundaram a bitBOX Electronic Systems na incubadora de empresas da Universidade de Aveiro, que mais tarde tornou-se na BEEVERYCREATIVE, a empresa que criou a primeira impressora 3D portuguesa.",
				photo_url: "img/speakers/fmendes.jpg",
				web_site: "https://www.beeverycreative.com",
				twitter_account: "https://twitter.com/fmendes75/",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Roberto Machado",
				role: "CEO",
				biography: "Engenheiro Informático de formação pela Universidade do Minho, tem muita experiência em Gestão e Empreendedorismo. Sempre teve especial interesse na criação de novos projectos. Atualmente é CEO da Group Buddies, uma empresa que desenvolve produtos web e mobile, onde tem a oportunidade de gerir um grupo de profissionais apaixonados pelo mundo da Web.",
				photo_url: "img/speakers/rmachado.jpg",
				web_site: "http://groupbuddies.com/",
				twitter_account: "https://twitter.com/rmdgb",
				github_account: "https://github.com/rmdmachado",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Miguel Palhas",
				role: "Developer & SysAdmin",
				biography: "Formado na Universidade do Minho, mantém ainda a sua paixão por alta performance e Game Development. Juntou-se à Group Buddies para poder continuar a experimentar novas tecnologias e trabalhar em projectos aliciantes. Fez parte da organização da primeira RubyConf Portugal e é um contribuidor extremamente activo para a comunidade de Open Source",
				photo_url: "img/speakers/mpalhas.jpg",
				web_site: "",
				twitter_account: "https://twitter.com/Naps62",
				github_account: "https://github.com/naps62",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Gabriel Poça",
				role: "Developer",
				biography: "Ninguém sabe realmente muito sobre ele mas diz-se que estudou na Universidade do Minho, que é viciado em software e que o seu primeiro tweet ocorreu no dia 13 de Maio de 2010. Consta que faz magia e tem tiques nervosos.",
				photo_url: "img/speakers/gpoca.png",
				web_site: "http://gabrielpoca.com/",
				twitter_account: "https://twitter.com/gabrielgpoca",
				github_account: "https://github.com/gabrielpoca",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "João Justo",
				role: "Developer",
				biography: "Estudante de Engenharia de Informática e Computação na U.P. Os seus principais interesses são aplicações móveis e jogos. Recentemente começou a aprender e a ganhar uma especial curiosidade por tecnologias web, tendo entrado para a Group Buddies como apprentice, onde acabou por ganhar um lugar como developer.",
				photo_url: "img/speakers/jjusto.jpg",
				web_site: "",
				twitter_account: "https://twitter.com/jpjustonunes",
				github_account: "https://github.com/joaojusto",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Rafael D'Escoffier",
				role: "Developer",
				biography: "Estudante de Engenharia Informática na Universidade do Minho e programador na BloomIdea, com foco especial no desenvolvimento de soluções na área das aplicações móveis. Otimista incurável e geek praticante, apaixonado pela tecnologia, natureza e desporto.",
				photo_url: "img/speakers/rdescoffier.png",
				web_site: "http://bloomidea.com/",
				twitter_account: "",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Paulo Vieira",
				role: "Developer",
				biography: "Licenciado em Engenharia Informática pela Universidade do Minho, ao longo dos anos, tem estado envolvido na maioria dos projetos e produtos em que a ImobileMagic tem trabalhado, com um foco particular em desenvolvimento de soluções multimédia para vários clientes e no produto de localização e proteção familiar PhoneNear Family Safety. Tem uma experiência já muito vasta em aplicações móveis e, em particular, no ecossistema iOS",
				photo_url: "img/speakers/pvieira.jpg",
				web_site: "http://www.imobilemagic.com/",
				twitter_account: "https://twitter.com/imobilemagic",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Francisco Costa",
				role: "CEO & Founder",
				biography: "Empreendedor de sucesso, licenciado em Engenharia de Sistemas e Informática pela Universidade do Minho. Apaixonado por tecnologia, conta já com mais de uma década de experiência e muito sucesso acumulado em diversas áreas como E-Commerce, Social Shopping e Digital Marketing",
				photo_url: "img/speakers/fcosta.jpg",
				web_site: "https://franciscocosta.com/",
				twitter_account: "https://twitter.com/franciscocosta",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Nuno Fernandes",
				role: "D&R Director",
				biography: "Licenciado pela Universidade do Minho em Engenharia de Sistemas e Informática é actualmente Diretor de Investigação e Desenvolvimento da Eurotux Informática. Co-Autor do livro Apache Instalação, Configuração Gestão Servidores Web, editado pela FCA, tem sido responsável pela implementação de diversos projectos de infra-estruturas tecnológicas de grande porte.",
				photo_url: "img/speakers/nfernandes.png",
				web_site: "http://www.eurotux.com",
				twitter_account: "",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Rui Figueira",
				role: "Developer",
				biography: "Tem 10 anos de experiência em desenvolvimento web, principalmente em Java. Adora programar e automatizar tarefas aborrecidas (de aborrecido a divertido), e por isso criou o Minium, uma ferramenta para automatização de tarefas e testes web no browser.",
				photo_url: "img/speakers/rfiqueira.jpg",
				web_site: "http://www.vilt-group.com/en/",
				twitter_account: "",
				github_account: "https://github.com/ruifigueira",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Norberto Henriques",
				role: "Especialista de UX",
				biography: "Iniciou a sua atividade durante o seu percurso académico, em projetos de business intelligence com a Oracle e Portugal Telecom. Desde então tem estado ligado à investigação e desenvolvimento em áreas relacionadas com aplicações para a Internet, multimédia e usabilidade. Foi colaborador no Instituto Politécnico de Leiria e foi responsável pela U.C. de Desenho da Interação dos cursos de Engenharia Informática e Informática para a Saúde durante vários anos. Em 2014 integrou a equipa de User Experience da WeDo Technologies, onde é atualmente Especialista de UX.",
				photo_url: "img/speakers/nhenriques.jpg",
				web_site: "https://www.linkedin.com/in/norbertohenriques",
				twitter_account: "",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			},
			{
				name: "Rui Antunes",
				role: "Fundador FPV Portugal",
				biography: "Sempre se interessou com tudo o que estava relacionado com tecnologia e desde alguns anos que tem experiência em aeromodelismo, há cerca de 4 anos começou a ter contacto com multirotores. Actualmente frequenta o 2o ano de Engenharia Informática na Escola Superior de Tecnologia de Castelo Branco.",
				photo_url: "img/speakers/rantunes.jpg",
				web_site: "http://fpvportugal.com/",
				twitter_account: "",
				github_account: "",
				company: nil,
				editions: [editions[0]]
			}
		])
	end
end

module Seed
	def self.activities(editions, speakers)
		Activity.create!([
			{
				name: 'API Driven Development',
				url_escaped_name: CGI::escape(I18n.transliterate('API Driven Development'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Com o surgimento de várias plataformas e web services, é necessário complementar qualquer serviço que queiramos oferecer com uma API digna. Nesta palestra de uma hora e meia, os nossos parceiros da Seegno irão mostrar-te os conceitos básicos de uma API e como devem ser construídas.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 18, 11, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 18, 13, 30),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/api.png'
			},
			{
				name: 'Reunião Geral de Alunos',
				url_escaped_name: CGI::escape(I18n.transliterate('Reunião Geral de Alunos'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'À semelhança do ano passado, haverá uma reunião de duas horas para debater o estado atual do curso. Gostaríamos de contar com presença de todos os alunos, para podermos ouvir a opinião de cada um e assim ajudar a melhorar a licenciatura. A reunião contará com a presença da direção de curso.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 18, 14, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 18, 16, 0),
				activity_type: ActivityType::DISCUSSION,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/rga.png'
			},
			{
				name: 'Corrida Social',
				url_escaped_name: CGI::escape(I18n.transliterate('Corrida Social'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'A primeira edição da “Corrida Social CeSIUM” foi um evento memorável! O montante arrecadado a partir das inscrições dos participantes resultou nuns espantosos 315€ que reverteram totalmente para o Fundo de Emergência Social da Universidade do Minho.
				Este ano depende de todos nós superar este valor. No dia 18 de Fevereiro tu podes ser o verdadeiro herói desta história! Contamos contigo? O percurso está estrategicamente pensado de maneira a que todos os alunos, funcionários e docentes da Universidade do Minho possam participar, independentemente da sua preparação física.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 18, 16, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 18, 18, 30),
				activity_type: ActivityType::SOCIAL,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/socialrun.jpg'
			},
			{
				name: 'Sessão de Abertura',
				url_escaped_name: CGI::escape(I18n.transliterate('Sessão de Abertura'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Sessão inaugural da edição deste ano. Será apresentado o calendário, os desafios e os parceiros da SEI - Semana da Engenharia Informática. E, possivelmente, uma ou duas surpresas.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 16, 9, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 16, 11, 0),
				activity_type: ActivityType::PRESENTATION,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/abertura.png'
			},
			{
				name: 'Introdução ao Android 5.0 Lollipop',
				url_escaped_name: CGI::escape(I18n.transliterate('Introdução ao Android 5.0 Lollipop'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'A BloomIdeia vai dar a conhecer uma das principais novidades do Android Lollipop, o Material Design.
				Esta sessão será composta por uma componente teórica com uma pequena introdução sobre as principais mudanças e uma parte prática, onde se vai desenvolver uma aplicação para experimentar alguns dos elementos implementados nesta última versão do Android.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 16, 11, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 16, 13, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Rafael D')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/androidl.jpg'
			},
			{
				name: 'Vídeo Jogos Além-Fronteiras',
				url_escaped_name: CGI::escape(I18n.transliterate('Vídeo Jogos Além-Fronteiras'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Hélder Pinto, 3D Environment Artist, irá introduzir-te a game development, passando pelo seu início enquanto autodidata até à sua experiência na Blizzard Entertainment. Durante duas horas, poderás ouvir e aprender sobre os desafios que se apresentam no mundo dos vídeo-jogos.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 16, 14, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 16, 16, 0),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Hélder Pinto')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/gaming.png'
			},
			{
				name: 'Moeda Virtual',
				url_escaped_name: CGI::escape(I18n.transliterate('Moeda Virtual'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Nesta palestra de uma hora, terás a oportunidade de, com a Bitreserve, aprender conceitos e tecnologias que fazem parte das moedas virtuais. Serão abordados assuntos como colored coins, stellar, ethereum, entre outros.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 16, 16, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 16, 18, 30),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/cryptocurrency.png'
			},
			{
				name: 'Hackathon Seegno',
				url_escaped_name: CGI::escape(I18n.transliterate('Hackathon Seegno'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Como já vem sendo tradição no CeSIUM, haverá mais uma Hackathon na SEI! Desta vez, com o patrocínio da Seegno, terás a oportunidade de participar em vários desafios e atividades ao longo do dia!
                        Durante a Hackathon irá decorrer um workshop de Rust, uma sessão de Time Trial Talks e um Presentation Karaoke. Ao longo do dia poderás participar em muitos outros desafios que te propomos!
                        Pré-Inscrição',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 21, 10, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 21, 12, 0),
				activity_type: ActivityType::CHALLENGE,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/hackathon.jpg'
			},
			{
				name: 'Rust',
				url_escaped_name: CGI::escape(I18n.transliterate('Rust'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Rust é a emergente linguagem de sistemas da Mozilla. Caracterizada pela sua velocidade, controlo de concorrência e pela type safety, promete tornar-se uma das mais inovadoras linguagens de programação. A Group Buddies irá juntar-se à nossa hackathon para um workshop de hora e meia onde poderás aprender os básicos que compõe esta linguagem.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 21, 11, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 21, 13, 0),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Miguel Palhas')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/rust.svg.png'
			},
			{
				name: 'Time Trial Talks',
				url_escaped_name: CGI::escape(I18n.transliterate('Time Trial Talks'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Um dos vários concursos disponíveis ao longo da Hackathon Seegno. Cada concorrente é desafiado a fazer uma micro-apresentação com no máximo 5 minutos sobre um tema à sua escolha. Haverá um prémio para o vencedor.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 21, 14, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 21, 16, 30),
				activity_type: ActivityType::CHALLENGE,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/ttt.png'
			},
			{
				name: 'Presentation Karaoke',
				url_escaped_name: CGI::escape(I18n.transliterate('Presentation Karaoke'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Este é o momento de convívio e pura diversão característico das nossas hackathons. Cada participante irá submeter uma apresentação que, no entanto, irá ser apresentada por um dos outros concorrentes. O melhor orador terá direito a um prémio.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 21, 16, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 21, 18, 0),
				activity_type: ActivityType::CHALLENGE,
				place: '',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/presentation.jpg'
			},
			{
				name: 'HTML 5 & CSS 3',
				url_escaped_name: CGI::escape(I18n.transliterate('HTML 5 & CSS 3'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'HTML5 e CSS3 são ferramentas essenciais para qualquer web developer. A Group Buddies irá juntar-se a nós para um workshop de duas horas onde se irá cobrir o essencial das versões mais recentes de estas linguagens e a sua aplicação na web.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 20, 9, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 20, 11, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'João Justo')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/html.png'
			},
			{
				name: 'User Experience: This is How WeDo It',
				url_escaped_name: CGI::escape(I18n.transliterate('User Experience: This is How WeDo It'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'User Experience implica quebrar barreiras: entre o cliente e o software, no seio das equipas de desenvolvimento e especialmente na forma de pensar de todos os envolvidos no produto. Nesta apresentação  de 1h30, Norberto Henriques irá falar sobre algumas das técnicas mais comuns de UX / User Research e como é que estas são usadas na.WeDo.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 20, 11, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 20, 13, 30),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Norberto Henriques')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/ux.png'
			},
			{
				name: 'Python + web2py',
				url_escaped_name: CGI::escape(I18n.transliterate('Python + web2py'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Francisco Tomé Costa irá estar connosco para um workshop de duas horas sobre Python, onde poderás aprender e trabalhar não só esta linguagem popular como também com a framework web2py.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 20, 14, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 20, 16, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Francisco Costa')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/python.svg.png'
			},
			{
				name: 'Saiba Mais Sobre Drones',
				url_escaped_name: CGI::escape(I18n.transliterate('Saiba Mais Sobre Drones'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Com a FPV terás a oportunidade de participar num workshop teórico-prático de uma hora e meia. Na teoria aprenderás, resumidamente, conceitos como sistema embebido, multirotor e como este se sustenta no ar, quais as partes que o constituem, entre outros. Na componente prática, terás a oportunidade de ver como se ligam todos os componentes, havendo, no final, um voo de teste.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 20, 17, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 20, 19, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Rui Antunes')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/drone.png'
			},
			{
				name: 'Arduíno',
				url_escaped_name: CGI::escape(I18n.transliterate('Arduíno'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'A InMotion  junta-se mais uma vez a nós para um workshop onde terás oportunidade de conhecer estes micro-dispositivos que estão a revolucionar o mundo da tecnologia quer pelo seu tamanho, quer pelo seu custo, quer pelo leque de funcionalidades oferecidas.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 20, 18, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 20, 20, 0),
				activity_type: ActivityType::WORKSHOP,
				place: '',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/arduino.png'
			},
			{
				name: 'Swift',
				url_escaped_name: CGI::escape(I18n.transliterate('Swift'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Workshop de duas horas dada pela iMobileMagic de introdução ao desenvolvimento em Swift, uma linguagem de programação criada pela Apple para iOS e OS X como uma alternativa mais simples e robusta ao Objective-C. Serão abordados fundamentos do desenvolvimento através da apresentação de exemplos.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 19, 9, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 19, 11, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Paulo Vieira')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/swift.png'
			},
			{
				name: 'DevOps',
				url_escaped_name: CGI::escape(I18n.transliterate('DevOps'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Num contexto de equipa é necessário haver integração, automação, comunicação e colaboração entre os developers e a equipa de operations. DevOps é a abordagem de desenvolvimento que concilia os dois e ajuda na construção rápida de produtos e serviços de qualidade. A Eurotux irá conduzir uma palestra de uma hora e meia onde poderás aprender sobre este método.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 19, 11, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 19, 13, 30),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/devops.png'
			},
			{
				name: 'Modelação 3D',
				url_escaped_name: CGI::escape(I18n.transliterate('Modelação 3D'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Neste evento poderás conhecer em primeira mão a evolução da Bee Very Creative e a história da Bee The First, a primeira impressora 3D portuguesa. Irão ser abordados assuntos como a tecnologia de impressão 3D e o panorama atual, bem como uma série de projetos da  Bee Very Creativeve',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 19, 14, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 19, 16, 0),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Francisco Mendes')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/3d_printing.jpg'
			},
			{
				name: 'Behaviour Driven Development',
				url_escaped_name: CGI::escape(I18n.transliterate('Behaviour Driven Development'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Para as empresas e para os developers, é essencial construir software capaz de satisfazer corretamente os requisitos do cliente. Nesse sentido, surgiu o BDD - Behaviour Driven Development, um processo que alia a facilidade de criação de testes à segurança a que estes conduzem. A  VILT irá durante esta palestra de uma hora e meia ensinar-te-à uma introdução a Behaviour Driven Development, aplicado a projectos web com Cucumber e a ferramenta Open Source Minium na automatização de testes.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 19, 16, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 19, 18, 30),
				activity_type: ActivityType::TALK,
				place: '',
				speakers: [find_speaker(speakers, 'Rui Figueira')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/bdd.png'
			},
			{
				name: 'Quiz Show',
				url_escaped_name: CGI::escape(I18n.transliterate('Quiz Show'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'O primeiro Quiz Show da SEI está aí! Junta-te a nós para participar num momento de convívio e diversão, onde poderás testar o teu conhecimento e ganhar um prémio.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 19, 22, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 20, 0, 0),
				activity_type: ActivityType::LOUNGE,
				place: '',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/quiz.png'
			},
			{
				name: 'CoderDojo Minho',
				url_escaped_name: CGI::escape(I18n.transliterate('CoderDojo Minho'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'O CoderDojo Minho é um movimento aberto e sem fins lucrativos para ensinar jovens dos 7 aos 17 a programar. Com a ajuda de membros ativos da comunidade, os mais novos têm a oportunidade de entrar em contacto com o mundo da programação.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 14, 10, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 14, 12, 0),
				activity_type: ActivityType::SOCIAL,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/coderdojo.jpg'
			},
			{
				name: 'Improve Braga',
				url_escaped_name: CGI::escape(I18n.transliterate('Improve Braga'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'O Improve Braga é um encontro de jovens no qual se procura resolver problemas da cidade através de projectos tecnológicos. Desde sites a aplicações móveis, os projetos nascem e são desenvolvidos por quem tem iniciativa para fazer de Braga uma cidade melhor.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 14, 14, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 14, 16, 0),
				activity_type: ActivityType::SOCIAL,
				place: 'DI A2',
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/improve.jpg'
			},
			{
				name: 'Unity 3D',
				url_escaped_name: CGI::escape(I18n.transliterate('Unity 3D'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Junto com Luís Fonseca da X-Team, durante duas horas, aprenderás os básicos de Unity 3D, um sistema de criação de jogos usado em desenvolvimento para websites, desktop, consolas e plataformas móveis.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 17, 9, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 17, 11, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Luís Fonseca')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/unity.png'
			},
			{
				name: 'Product Development & Agile',
				url_escaped_name: CGI::escape(I18n.transliterate('Product Development & Agile'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'A Group Buddies dá-te a oportunidade de conhecer Agile, um conjunto de metodologias para desenvolvimento de software que promove planeamento flexível, rápida capacidade de resposta e aperfeiçoamento contínuo. Junta-te a nós neste workshop de 1h30 para aprenderes a optimizar as tuas técnicas de desenvolvimento.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 17, 11, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 17, 13, 30),
				activity_type: ActivityType::TALK,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Roberto Machado')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/agile.png'
			},
			{
				name: 'Xamarin',
				url_escaped_name: CGI::escape(I18n.transliterate('Xamarin'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Junto com a Storyo, apresentamos-te uma atividade de duas horas, onde aprenderás o caso de desenvolvimento da homónima Storyo, uma app portuguesa de Storytelling, desenvolvida em Xamarin para iOS e Android. Terás a oportunidade de resolver um exercício ilustrativo com o Xamarin Studio.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 17, 14, 0),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 17, 16, 0),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Manuel Costa')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/xamarin.png'
			},
			{
				name: 'Meteor.js',
				url_escaped_name: CGI::escape(I18n.transliterate('Meteor.js'.gsub(/(\s+|\.+)/, '-').downcase)),
				description: 'Neste workshop de uma hora e meia, poderás, com a ajuda da Group Buddies, aprender uma das mais promissoras plataformas Open Source. Meteor.js permite-te desenvolver rapidamente aplicações web e móveis, em real-time e com JavaScript puro.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 17, 16, 30),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 17, 18, 30),
				activity_type: ActivityType::WORKSHOP,
				place: 'DI A2',
				speakers: [find_speaker(speakers, 'Gabriel Poça')],
				edition: editions[0],
				poster_photo_url: '/sei_15_webpage/img/events/meteorjs.png'
			}
		])
	end

	def self.find_speaker(speakers, speaker_name)
		speakers.each do |s|
			return s if s.name.downcase.include? speaker_name.downcase
		end
		p "SPEAKER NO FOUND #{speaker_name}"
		nil
	end
end

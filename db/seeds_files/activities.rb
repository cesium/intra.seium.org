module Seed
	def self.activities(editions, speakers)
		Activity.create([
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
	end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

speakers = Speaker.create([
	{
		name: 'Hélder Pinto',
		biography: 'Atualmente encontra-se a trabalhar na empresa Blizzard, nos EUA.'
	}
])

activities = Activity.create([
	{
		name: 'Unity 3D',
		description: 'Workshop de introdução ao desenvolvimento de jogos a três dimensões usando a ferramenta Unity',
		begin_date: DateTime.civil_from_format(:local, 2015, 2, 17, 9),
		end_date: DateTime.civil_from_format(:local, 2015, 2, 17, 11),
		activity_type: ActivityType::WORKSHOP,
		place: 'Anfiteatro A2 @ DI',
		num_available_places: 60,
		speakers: speakers
	}
])


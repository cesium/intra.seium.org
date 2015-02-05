module Seed
	def self.users(editions, activities)
		User.create([
			{
				email: 'josealvim@sapo.pt',
				password: '123456789',
				first_name: 'José',
				last_name: 'Alvim',
				sex: UserSex::MALE,
				username: 'josealvim',
				birthday: DateTime.civil_from_format(:local, 1990, 4, 18),
				photo_url: 'https://media.licdn.com/mpr/mpr/shrink_500_500/p/2/005/06a/3fc/1c3bb12.jpg',
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
			},
			{
				email: 'beatrizmac@hotmail.com',
				password: '123456789',
				first_name: 'Beatriz',
				last_name: 'Machado',
				sex: UserSex::FEMALE,
				username: 'bmac',
				birthday: DateTime.civil_from_format(:local, 1988, 11, 25),
				photo_url: 'http://3.bp.blogspot.com/-WtP1AKDOng0/T8zwZgFCoVI/AAAAAAAADLQ/sjvlzF0G7ws/s320/574930_3538383931482_1028905081_3173764_590860986_n.jpg',
				is_student: true,
				is_student_at_minho_univ: false,
				is_organizer: false,
				university: 'Instituto Politécnico de Tomar',
				course: 'Design e Tecnologia das Artes Gráficas',
				activities: activities[0, 1],
				editions: editions
			},
			{
				email: 'tatianamiranda@gmail.com',
				password: '123456789',
				first_name: 'Tatiana',
				last_name: 'Miranda',
				sex: UserSex::FEMALE,
				username: 'tatim',
				birthday: DateTime.civil_from_format(:local, 1993, 5, 2),
				photo_url: 'https://pbs.twimg.com/profile_images/771755139/fot_068.jpg',
				is_student: false,
				activities: activities[1, 1],
				editions: editions
			}
		])
	end
end

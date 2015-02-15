module Seed
	def self.users(editions, activities)
		User.create!([
			{
				email: 'josealvim@sapo.pt',
				password: '123456789',
				first_name: 'José',
				last_name: 'Alvim',
				sex: UserSex::MALE,
				username: 'josealvim',
				birthday: DateTime.civil_from_format(:local, 1990, 4, 18),
				avatar: File.open("#{Rails.root}/public/images/users/josealvim.jpg"),
				is_univ_student: true,
				university: 'Universidade do Minho',
				course: 'Engenharia Informática',
				is_student_at_minho_univ: true,
				minho_univ_student_id: 'pg123456',
				is_inf_eng_student_at_minho_univ: true,
				is_cesium_associate: true,
				cesium_associate_number: 1043,
				is_organizer: true,
				organizer_role: 'Membro',
				activities: activities,
				editions: editions,
				location: 'Braga'
			},
			{
				email: 'beatrizmac@hotmail.com',
				password: '123456789',
				first_name: 'Beatriz',
				last_name: 'Machado',
				sex: UserSex::FEMALE,
				username: 'bmac',
				birthday: DateTime.civil_from_format(:local, 1988, 11, 25),
				avatar: File.open("#{Rails.root}/public/images/users/bmac.jpg"),
				is_organizer: false,
				university: 'Instituto Politécnico de Tomar',
				course: 'Design e Tecnologia das artes gráficas',
				activities: activities[0, 1],
				editions: editions,
				is_univ_student: true,
				is_student_at_minho_univ: false,
				is_inf_eng_student_at_minho_univ: false,
				is_cesium_associate: false,
				location: 'Braga'
			},
			{
				email: 'tatianamiranda@gmail.com',
				password: '123456789',
				first_name: 'Tatiana',
				last_name: 'Miranda',
				sex: UserSex::FEMALE,
				username: 'tatim',
				birthday: DateTime.civil_from_format(:local, 1993, 5, 2),
				avatar: File.open("#{Rails.root}/public/images/users/tatim.jpg"),
				is_univ_student: false,
				profession: "Designer",
				is_student_at_minho_univ: false,
				is_inf_eng_student_at_minho_univ: false,
				is_cesium_associate: false,
				activities: activities[1, 1],
				editions: editions,
				location: 'Braga'
			}
		])
	end
end

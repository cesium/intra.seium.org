module Seed
	def self.users(editions, activities)
		User.create([
			{
				email: 'foo@foo.foo',
				password: '123456789',
				first_name: 'José',
				last_name: 'Alvim',
				birthday: DateTime.civil_from_format(:local, 1990, 4, 18),
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
			}
		])
	end
end

module Seed
	def self.editions
		Edition.create!([
			{
				id: 2017,
				name: "III Semana de Engenharia Informática na Universidade do Minho",
				edition_number: 3,
				description: '3ª Edição da Semana da Engenharia Informática da Universidade do Minho',
				begin_date: DateTime.civil_from_format(:local, 2017, 2, 4),
				end_date: DateTime.civil_from_format(:local, 2017, 2, 11)
			}
		])
	end
end

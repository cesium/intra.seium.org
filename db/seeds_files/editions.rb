module Seed
	def self.editions
		Edition.create!([
			{
				id: 2016,
				name: "II Semana de Engenharia Informática na Universidade do Minho",
				edition_number: 2,
				description: '',
				begin_date: DateTime.civil_from_format(:local, 2016, 2, 6),
				end_date: DateTime.civil_from_format(:local, 2016, 2, 13)
			}
		])
	end
end

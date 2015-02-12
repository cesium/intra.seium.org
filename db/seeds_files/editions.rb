module Seed
	def self.editions
		Edition.create!([
			{
				id: 2015,
				name: "I Semana de Engenharia Informática na Universidade do Minho",
				edition_number: 1,
				description: 'A já conhecida "Semana da LEI" dá este ano pela primeira vez lugar à SEI - Semana da Engenharia Informática da Universidade do Minho. A SEI é uma semana totalmente organizada por alunos para os alunos. É gratuita e irá decorrer entre os dias 15 e 21 de Fevereiro.',
				begin_date: DateTime.civil_from_format(:local, 2015, 2, 15),
				end_date: DateTime.civil_from_format(:local, 2015, 2, 21)
			}
		])
	end
end

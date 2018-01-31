module Seed
  def self.editions
    Edition.create!([
      {
        id: 2018,
        name: "IV Semana de Engenharia Informática na Universidade do Minho",
        edition_number: 4,
        description: '4ª Edição da Semana da Engenharia Informática da Universidade do Minho',
        begin_date: DateTime.civil_from_format(:local, 2018, 2, 3),
        end_date: DateTime.civil_from_format(:local, 2018, 2, 10)
      }
    ])
  end
end

json.array!(@editions) do |edition|
  json.extract! edition, :id, :name, :edition_number, :description, :begin_date, :end_date
  json.url edition_url(edition, format: :json)
end

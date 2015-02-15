json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :description, :begin_date, :end_date, :type, :place
  json.url activity_url(activity, format: :json)
end

json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :email, :photo_url, :biography, :facebook_account, :twitter_account, :github_account, :google_plus_account
  json.url speaker_url(speaker, format: :json)
end

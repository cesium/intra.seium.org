json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :address, :is_partner, :partnership_type, :web_site, :facebook_account, :twitter_account, :github_account, :google_plus_account, :logo_url
  json.url company_url(company, format: :json)
end

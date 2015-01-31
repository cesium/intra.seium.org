class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false, index: true
      t.text :description
      t.string :address
      t.boolean :is_partner, null: false, default: false
      t.integer :partnership_type
      t.string :web_site
      t.string :facebook_account
      t.string :twitter_account
      t.string :github_account
      t.string :google_plus_account
      t.string :logo_url

      t.timestamps
    end
  end
end

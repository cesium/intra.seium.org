class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name, null: false, index: true
      t.string :email
      t.string :photo_url
      t.text :biography
      t.string :facebook_account
      t.string :twitter_account
      t.string :github_account
      t.string :google_plus_account

      t.timestamps
    end
  end
end

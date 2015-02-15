class RemovePhotoUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photo_url, :string
  end
end

class RemoveGooglePlusUsers < ActiveRecord::Migration
  def change
    remove_column :users, :google_plus_account
  end
end

class ChangeUserToSupportOAuth < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string

    remove_column :users, :encrypted_password, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
  end
end

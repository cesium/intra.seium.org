class AddUserNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, index: true
  end
end

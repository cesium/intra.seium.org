class AddLinkedInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linked_in_account, :string
  end
end

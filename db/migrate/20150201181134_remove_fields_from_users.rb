class RemoveFieldsFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :sash_id
    remove_column :users, :level
  end
end

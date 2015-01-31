class AddOrganizerInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_organizer, :boolean
    add_column :users, :organization_role, :string
  end
end

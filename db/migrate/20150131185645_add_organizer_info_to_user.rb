class AddOrganizerInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_organizer, :boolean
    add_column :users, :organizer_role, :string
  end
end

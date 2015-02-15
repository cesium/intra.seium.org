class AddRoleToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :role, :string
  end
end

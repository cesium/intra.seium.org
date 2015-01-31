class AddInformationToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :is_free, :boolean, null: false, default: true
    add_column :activities, :has_prizes, :boolean, null: false, default: false
  end
end

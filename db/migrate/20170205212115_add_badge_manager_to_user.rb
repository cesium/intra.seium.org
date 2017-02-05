class AddBadgeManagerToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_badge_manager, :boolean, default: false
  end
end

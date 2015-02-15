class AddTypeToBadge < ActiveRecord::Migration
  def change
    add_column :badges, :type, :integer, null: false, default: 0
		add_index :badges, :type
  end
end

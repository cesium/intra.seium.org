class AddCodeNameToBadge < ActiveRecord::Migration
  def change
    add_column :badges, :codename, :string, null: false, default: ""
		add_index :badges, :codename, unique: true
  end
end

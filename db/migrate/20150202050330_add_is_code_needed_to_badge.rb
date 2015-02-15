class AddIsCodeNeededToBadge < ActiveRecord::Migration
  def change
    add_column :badges, :is_code_needed, :boolean
  end
end

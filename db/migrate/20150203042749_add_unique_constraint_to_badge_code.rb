class AddUniqueConstraintToBadgeCode < ActiveRecord::Migration
  def change
		remove_index :badge_acquisitions, :code
		add_index :badge_acquisitions, :code, unique: true
  end
end

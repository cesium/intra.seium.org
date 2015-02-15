class AddCodeIndexToBadgeCode < ActiveRecord::Migration
  def change
		change_table :badge_codes do |t|
			t.index :code
		end
  end
end

class FixBadgeCodeColumnName < ActiveRecord::Migration
  def change
		change_table :badge_codes do |t|
			t.rename :expiration_date, :code_expiration_date
		end
  end
end

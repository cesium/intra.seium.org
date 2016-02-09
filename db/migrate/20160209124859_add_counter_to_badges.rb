class AddCounterToBadges < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :badge_acquisitions_count
    end
  end
end

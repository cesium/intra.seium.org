class ChangeDefaultBadgeAcquisitionsCount < ActiveRecord::Migration
  def change
    change_column :users, :badge_acquisitions_count, :integer, default: 0
  end
end

class RenameBadgeCodeToBadgeAcquisition < ActiveRecord::Migration
  def change
		rename_table :badge_codes, :badge_acquisitions
  end
end

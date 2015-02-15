class AddAcquisitionDateToBadgeAcquisition < ActiveRecord::Migration
  def change
    add_column :badge_acquisitions, :acquisition_date, :datetime
  end
end

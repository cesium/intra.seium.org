class AddExpirationDateToBadge < ActiveRecord::Migration
  def change
    add_column :badges, :expiration_date, :datetime
  end
end

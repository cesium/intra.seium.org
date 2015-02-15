class CreateBadgeCodes < ActiveRecord::Migration
  def change
    create_table :badge_codes do |t|
      t.references :badge, index: true
      t.references :user, index: true
      t.string :code
      t.integer :status
      t.datetime :expiration_date

      t.timestamps
    end
  end
end

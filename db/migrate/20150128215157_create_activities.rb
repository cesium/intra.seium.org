class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false, index: true
      t.text :description
      t.datetime :begin_date, null: false
      t.datetime :end_date
      t.integer :activity_type, null: false, index: true
      t.string :place
			t.string :poster_photo_url
			t.string :banner_photo_url
			t.integer :num_available_places
			t.float :registration_fee_in_euros
			t.text :prizes

      t.timestamps
    end
  end
end

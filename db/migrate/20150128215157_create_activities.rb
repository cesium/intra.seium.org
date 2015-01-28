class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.integer :type
      t.string :place

      t.timestamps
    end
  end
end

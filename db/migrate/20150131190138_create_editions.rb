class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :name
      t.integer :edition_number
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end

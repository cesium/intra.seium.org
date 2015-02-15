class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.text :category
      t.references :edition, index: true
      t.references :activity, index: true
      t.string :logo_url

      t.timestamps
    end
  end
end

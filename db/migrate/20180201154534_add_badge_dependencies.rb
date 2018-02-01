class AddBadgeDependencies < ActiveRecord::Migration
  def change
    add_reference :badges, :parent, references: :badges, index: true
  end
end

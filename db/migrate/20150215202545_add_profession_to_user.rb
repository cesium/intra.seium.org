class AddProfessionToUser < ActiveRecord::Migration
  def change
    add_column :users, :profession, :string
  end
end

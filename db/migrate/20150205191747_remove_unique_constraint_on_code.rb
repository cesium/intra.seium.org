class RemoveUniqueConstraintOnCode < ActiveRecord::Migration
  def change
		remove_index :badge_acquisitions, :code
		add_index :badge_acquisitions, :code
  end
end

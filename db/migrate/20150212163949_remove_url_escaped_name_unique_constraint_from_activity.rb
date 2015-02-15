class RemoveUrlEscapedNameUniqueConstraintFromActivity < ActiveRecord::Migration
  def change
		remove_index :activities, :url_escaped_name
		add_index :activities, :url_escaped_name
  end
end

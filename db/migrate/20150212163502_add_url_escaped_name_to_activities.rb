class AddUrlEscapedNameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :url_escaped_name, :string, null: false, default: ""
		add_index :activities, :url_escaped_name, unique: true
  end

end

class RemoveUserSexDefaultValue < ActiveRecord::Migration
  def change
		change_column_default :users, :sex, nil
  end
end

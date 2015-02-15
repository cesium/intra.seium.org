class ChangeUserDefaultValues < ActiveRecord::Migration
  def change
		change_column_default :users, :sex, UserSex::UNDEFINED
		change_column_default :users, :is_organizer, false
  end
end

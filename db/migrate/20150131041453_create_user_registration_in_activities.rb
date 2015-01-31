class CreateUserRegistrationInActivities < ActiveRecord::Migration
  def change
		create_table :activities_users, id: false do |t|
			t.belongs_to :user, index: true
			t.belongs_to :activity, index: true
		end
  end
end

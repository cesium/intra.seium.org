class CleanDb < ActiveRecord::Migration
  def change
    drop_table :activities
    drop_table :activities_speakers
    drop_table :activities_users
    drop_table :companies
    drop_table :companies_editions
    drop_table :editions_speakers
    drop_table :editions_users
    drop_table :speakers
    remove_column :badges, :activity_id
  end
end

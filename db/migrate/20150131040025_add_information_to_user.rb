class AddInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :biography, :text
    add_column :users, :is_student, :boolean
    add_column :users, :is_student_at_minho_univ, :boolean
    add_column :users, :is_inf_eng_student_at_minho_univ, :boolean
    add_column :users, :is_cesium_associate, :boolean
    add_column :users, :cesium_associate_number, :integer
    add_column :users, :minho_univ_student_id, :string
    add_column :users, :university, :string
    add_column :users, :course, :string
    add_column :users, :photo_url, :string
    add_column :users, :facebook_account, :string
    add_column :users, :twitter_account, :string
    add_column :users, :github_account, :string
    add_column :users, :google_plus_account, :string
  end
end

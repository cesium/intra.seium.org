class RenameIsStudentToIsUnivStudentOnUser < ActiveRecord::Migration
  def change
		change_table :users do |t|
			t.rename :is_student, :is_univ_student
		end
  end
end

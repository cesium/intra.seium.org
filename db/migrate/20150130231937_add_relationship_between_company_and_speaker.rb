class AddRelationshipBetweenCompanyAndSpeaker < ActiveRecord::Migration
  def change
		change_table :speakers do |t|
			t.belongs_to :company, index:true
		end
  end
end

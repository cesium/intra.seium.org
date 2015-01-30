class CreateRelationshipBetweenActivitiesAndSpeakers < ActiveRecord::Migration
  def change
    create_table :activities_speakers, id: false do |t|
			t.belongs_to :activity, index:true
			t.belongs_to :speaker, index: true
    end
  end
end

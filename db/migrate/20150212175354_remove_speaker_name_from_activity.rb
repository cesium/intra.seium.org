class RemoveSpeakerNameFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :speaker_name
  end
end

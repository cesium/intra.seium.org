class AddSpeakerNameToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :speaker_name, :string
  end
end

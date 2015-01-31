class AddWebSiteToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :web_site, :string
  end
end

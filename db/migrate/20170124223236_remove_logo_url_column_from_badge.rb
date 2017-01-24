class RemoveLogoUrlColumnFromBadge < ActiveRecord::Migration
  def change
    remove_column :badges, :logo_url, :string
  end
end

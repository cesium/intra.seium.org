class AddAvatarToBadge < ActiveRecord::Migration
  def self.up
    add_attachment :badges, :avatar
  end

  def self.down
    remove_attachment :badges, :avatar
  end
end

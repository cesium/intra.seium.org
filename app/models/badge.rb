class Badge < ActiveRecord::Base
  belongs_to :edition
  belongs_to :activity
end

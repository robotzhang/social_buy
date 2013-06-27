class Theme < ActiveRecord::Base
  attr_accessible :bg_image, :store_id
  belongs_to :store
  mount_uploader :bg_image, ImageUploader
end

class Post < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :tag
  
  mount_uploader :image, ImageUploader
end

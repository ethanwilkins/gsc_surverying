class Post < ActiveRecord::Base
  belongs_to :user
  validate :unique_tag?, on: :save
  
  mount_uploader :image, ImageUploader
  
  def unique_tag?
    if Post.find_by_id(tag: self.tag) and not self.tag.nil?
      errors.add(:post, "not unique")
    end
  end
end

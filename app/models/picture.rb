class Picture < ApplicationRecord
  belongs_to :user
  validates :content, presence: true 
  mount_uploader :post_image, ImageUploader
end

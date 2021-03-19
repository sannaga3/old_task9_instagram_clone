class Picture < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {minimum:1, maximum:50}
  mount_uploader :post_image, ImageUploader
end

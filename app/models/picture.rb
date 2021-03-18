class Picture < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {minimum:1, maximum:60}
  mount_uploader :post_image, ImageUploader
end

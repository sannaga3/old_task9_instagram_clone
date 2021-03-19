class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :content, presence: true, length: {minimum:1, maximum:50}
  mount_uploader :post_image, ImageUploader
end

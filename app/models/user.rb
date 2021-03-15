class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true, length: { in: 1..20 }
  validates :email, length: { in: 1..50 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true, allow_blank: true, on: :update
  validates :email, presence: true, allow_blank: true, on: :edit_case
  validates :password, length: { minimum: 6 }, on: :create
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true, on: :update
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true, on: :edit_case
  has_many :pictures, dependent: :destroy
end

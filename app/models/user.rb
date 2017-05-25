class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end

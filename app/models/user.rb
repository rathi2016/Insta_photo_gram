class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }

  has_many :posts, dependent: :destroy
end

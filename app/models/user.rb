class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, email: true
  validates :password, presence: true, length: { minimum: 6 }
end

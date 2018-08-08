class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end

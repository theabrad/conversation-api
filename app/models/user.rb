class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true
  validates :password, presence: { on: :create }
  validates :email, uniqueness: true
end

class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true
  validates :password, presence: { on: :create }
  validates :email, uniqueness: true

  has_many :messages
  has_many :user_conversations
  has_many :conversations, through: :user_conversations

  
end

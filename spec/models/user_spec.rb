require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end

  context "associations" do
    it { should have_many(:messages) }
    it { should have_many(:user_conversations) }
    it { should have_many(:conversations).through(:user_conversations) }
  end
end

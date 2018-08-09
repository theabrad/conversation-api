require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context "associations" do
    it { should have_many(:messages) }
    it { should have_many(:user_conversations) }
    it { should have_many(:users).through(:user_conversations) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
end

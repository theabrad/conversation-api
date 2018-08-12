FactoryBot.define do
  factory :message do
    body { Faker::PrincessBride.quote }
    user
    conversation
  end
end

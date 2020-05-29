FactoryBot.define do
  factory :dashboard do
    user { create(:user) }
    title { "First Dashboard" }
    content  { "Just some random content" }
  end
end

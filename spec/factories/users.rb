FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@test.ee" }
    password { 'testpassword' }
    password_confirmation { 'testpassword' }
  end
end

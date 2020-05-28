FactoryBot.define do
  factory :user do
    email { 'test@test.ee' }
    password { 'testpassword' }
    password_confirmation { 'testpassword' }
  end
end

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password { 'password' }
    created_at { Date.today }
    updated_at { Date.today }
  end
end

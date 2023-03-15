FactoryBot.define do
  factory :user do
    
    name { '池田 徹' }
    sequence(:email) { |n| 'user#{n}@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    password_digest { BCrypt::Password.create(password) }
  end
end

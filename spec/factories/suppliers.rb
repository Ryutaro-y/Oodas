FactoryBot.define do
  factory :supplier do
    
    name { 'インク印刷株式会社' }
    sequence(:email) { |n| 'supplier#{n}@example.com' }
  end
end

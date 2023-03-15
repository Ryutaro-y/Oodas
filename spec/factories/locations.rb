FactoryBot.define do
  factory :location do
    
    name { 'ロケーション1' }
    stage { 1 }

    association :ink

    trait :with_ink_name do
      ink_name { 'R100' }
    end
  end
end

FactoryBot.define do

  factory :stock do

    color_type { '赤' }
    location_name { 'ロケーション1' }
    stage { 2 }
    quantity { 5 }
    sequence(:user_id) { |n| n }

    association :location
    association :user

    trait :with_ink_name do
      ink_name { 'R100' }
    end

  end
end

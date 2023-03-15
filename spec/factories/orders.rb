FactoryBot.define do

  factory :order do

    order_quantity { 10 }
    order_date { '2023-03-13' }
    sequence(:user_id) { |n| n }
    sequence(:supplier_id) { |n| n }

    association :stock
    association :supplier
    association :user

    trait :with_ink_name do
      ink_name { 'R100' }
    end

  end
end

FactoryBot.define do
  factory :item do
    item_name { '商品名テスト' }
    description { '商品の説明テスト' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_burden_id { 2 }
    prefecture_id { 4 }
    shipping_duration_id { 3 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

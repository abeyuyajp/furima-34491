FactoryBot.define do
  factory :item do
    text { Faker::Lorem.sentence }
    name { 'testテスト' }
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    prefecture_id {2}
    shipping_day_id {2}
    price { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end

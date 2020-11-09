FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end

    title                 { 'aaa' }
    explanation           { 'ジャケット２０１９年購入' }
    category_id           { 1 }
    status_id             { 1 }
    shipping_fee_id       { 1 }
    location_id           { 1 }
    delivery_time_id      { 1 }
    selling_price         { 333 }
  end
end

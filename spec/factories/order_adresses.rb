FactoryBot.define do
  factory :order_adress do
    postal_code { '333-3333' }
    prefecture_id { 1 }
    city { '久喜市' }
    house_number { '南栗橋10-6-3' }
    building_name { '久喜ビル101' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

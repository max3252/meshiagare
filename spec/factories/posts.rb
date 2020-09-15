FactoryBot.define do
  factory :post do
    name { 'content' }
    genre_id { '2' }
    allergies { '卵' }
    store_name { 'store'}
    price { '1000' }
    address { '東京都' }
    text { 'info' }
    association :user
  end
end
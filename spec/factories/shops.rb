FactoryBot.define do
  factory :shop do
    name {Faker::Name}
    title {Faker::String.random}
    content {Faker::String.random}
    open_hour {Faker::String.random}
    regular_holiday {Faker::String.random}
    telephone {Faker::Number.number(digits: 11)}
    address {Faker::Address.full_address}
    nearest_station {Faker::String.random}
    capacity {Faker::String.random}
    private_room {Faker::String.random}
    wifi {Faker::String.random}
    power_supply {Faker::String.random}
    genre_id {Faker::Number.within(range: 1..7)}
    area_id {Faker::Number.within(range: 1..10)}

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/shop_test1.jpg'), filename: 'shop_test1.jpg')
      item.images.attach(io: File.open('public/images/shop_test2.jpg'), filename: 'shop_test2.jpg')
      item.images.attach(io: File.open('public/images/shop_test3.jpg'), filename: 'shop_test3.jpg')
    end
  end

  factory :shop_caracteristic do
    association :shop
    association :characteristic
  end
end
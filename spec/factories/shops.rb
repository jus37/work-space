FactoryBot.define do
  factory :shop do
    name { Faker::Name.name }
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    open_hour { Faker::Lorem.word }
    regular_holiday { Faker::Lorem.word }
    telephone { Faker::Number.number(digits: 11) }
    address { Faker::Address.full_address }
    nearest_station { Faker::Lorem.word }
    capacity { Faker::Lorem.word }
    private_room { Faker::Lorem.word }
    wifi { Faker::Lorem.word }
    power_supply { Faker::Lorem.word }

    association :genre
    association :area
    genre_id { Faker::Number.within(range: 1..7) }
    area_id { Faker::Number.within(range: 1..10) }

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/shop_test1.jpg'), filename: 'shop_test1.jpg')
      item.images.attach(io: File.open('public/images/shop_test2.jpg'), filename: 'shop_test2.jpg')
      item.images.attach(io: File.open('public/images/shop_test3.jpg'), filename: 'shop_test3.jpg')
    end
  end
end

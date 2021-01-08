FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    telephone {Faker::Number.number(digits: 11)}
    comment {Faker::Coffee.blend_name}
    admin {1}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/user_test.jpg'), filename: 'user_test.jpg')
    end
  end
end
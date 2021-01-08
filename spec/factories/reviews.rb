FactoryBot.define do
  factory :review do
    review_point {Faker::Number.within(range: 0..5)}
    date {Faker::Date.between(to: Date.today)}
    title {Faker::String.random}
    comment {Faker::String.random}
    association :user
    association :shop
  end
end
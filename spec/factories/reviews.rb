FactoryBot.define do
  factory :review do
    review_point {Faker::Number.within(range: 1..5)}
    date {Faker::Date.between(from: '2000-01-01', to: Date.today)}
    title {Faker::String.random}
    comment {Faker::String.random}
    association :user
    association :shop
  end
end
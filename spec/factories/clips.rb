Factories.define do
  factory :clip do
    association :user
    association :shop
  end
end

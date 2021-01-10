class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :date
    validates :title
  end
  with_options presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 } do
    validates :review_point
  end
end

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :review_point
    validates :date
    validates :content
  end
end

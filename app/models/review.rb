class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :date
    validates :title
  end
  with_options presence: true, format: { with: /[1-5]/ } do
    validates :review_point
  end
end

class Area < ApplicationRecord
  has_many :shops, dependent: :destroy
end

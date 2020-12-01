class Area < ApplicationRecord
  has_many :shop_area
  has_many :shops, through: :shop_area
end

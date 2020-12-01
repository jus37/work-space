class Area < ApplicationRecord
  has_many :shop_areas
  has_many :shops, through: :shop_areas
end

class Characteristic < ApplicationRecord
  has_many :shop_characteristics
  has_many :shops, through: :shop_characteristics

end

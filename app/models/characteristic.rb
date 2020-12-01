class Characteristic < ApplicationRecord
  has_many :shop_caracteristics
  has_many :shops, through: :shop_caracteristics

end

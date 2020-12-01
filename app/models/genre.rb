class Genre < ApplicationRecord
  has_many :shop_genre
  has_many :shops, through: :shop_genre
end

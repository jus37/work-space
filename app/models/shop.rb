class Shop < ApplicationRecord
  has_many_attached :images
  has_many :reviews, dependent: :destroy
  has_many :shop_caracteristics
  has_many :characteristics, through: :shop_caracteristics, dependent: :destroy
  has_many :shop_areas
  has_many :areas, through: :shop_areas, dependent: :destroy
  has_many :shop_genres
  has_many :genres, through: :shop_genres, dependent: :destroy


  with_options presence: true do
    validates :name
    validates :title
    validates :open_hour
    validates :regular_holiday
    validates :address
    validates :images
  end

end

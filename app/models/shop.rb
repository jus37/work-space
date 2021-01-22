class Shop < ApplicationRecord
  has_many_attached :images
  has_many :reviews, dependent: :destroy
  has_many :shop_caracteristics
  has_many :characteristics, through: :shop_caracteristics, dependent: :destroy
  belongs_to :genre
  belongs_to :area
  has_many :clips
  has_many :users, through: :clips, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :address
    validates :genre_id
    validates :area_id
  end

end

class Shop < ApplicationRecord
  has_many_attached :images
  has_many :reviews, dependent: :destroy
  has_many :shop_caracteristics
  has_many :characteristics, through: :shop_caracteristics, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area

  with_options presence: true do
    validates :name
    validates :title
    validates :open_hour
    validates :regular_holiday
    validates :address
    validates :images
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :area_id
  end

  def self.search(search)
    if search != ""
      Shop.where(['name LIKE ? OR nearest_station LIKE ?',"%#{search}%","%#{search}%"])
    else
      Shop.all
    end
  end
end

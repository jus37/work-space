class Shop < ApplicationRecord
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  belongs_to :characteristic

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
    validates :characteristic_id
  end
end

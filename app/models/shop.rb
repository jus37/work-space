class Shop < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  belongs_to :characteristic

  with_options numericality: { other_than: 1 } do
    validates :genre
    validates :area
    validates :characteristic
  end
end

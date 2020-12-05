class Shop < ApplicationRecord
  has_many_attached :images
  has_many :reviews, dependent: :destroy
  has_many :shop_caracteristics
  has_many :characteristics, through: :shop_caracteristics, dependent: :destroy
  belongs_to :genre
  belongs_to :area
  has_many :clips
  has_many :users, through: :clips
  has_many :histories
  has_many :users, through: :histories

  with_options presence: true do
    validates :name
    validates :title
    validates :open_hour
    validates :regular_holiday
    validates :address
    validates :images
  end

end

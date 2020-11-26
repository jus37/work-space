class Area < ActiveHash::Base

  include ActiveHash::Associations
  has_many :shops
end

class Genre < ActiveHash::Base
  include ActiveHash::Associations
  has_many :shops
end

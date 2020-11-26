class Characteristic < ActiveHash::Base
  include ActiveHash::Associations
  has_many :shops

end

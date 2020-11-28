class Characteristic < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '安い' },
    { id: 3, name: '夜遅くまで営業' },
    { id: 4, name: '雰囲気が良い' },
    { id: 5, name: '静か' }
  ]

  include ActiveHash::Associations
  has_many :shops
end

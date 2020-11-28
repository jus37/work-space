class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '梅田' },
    { id: 3, name: '難波' },
    { id: 4, name: '天王寺' },
    { id: 5, name: '本町' },
    { id: 6, name: '新大阪' },
    { id: 7, name: '北浜' },
    { id: 8, name: '江坂' },
    { id: 9, name: '京橋' },
    { id: 10, name: '堺' },
    { id: 11, name: '高槻' }
  ]

  include ActiveHash::Associations
  has_many :shops
end

class Characteristic < ActiveHash::Base

  { id: 1, name: '--' },  
  { id: 2, name: '安い' },
  { id: 3, name: '無料wifiあり' },
  { id: 4, name: '電源あり' },
  { id: 5, name: '夜遅くまで営業' },
  { id: 6, name: '個室あり' },
  { id: 7, name: '雰囲気が良い' },
  { id: 8, name: '静か' },
]

  include ActiveHash::Associations
  has_many :shops

end

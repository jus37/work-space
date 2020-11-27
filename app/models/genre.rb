class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },  
    { id: 2, name: 'カフェ' },
    { id: 3, name: 'ファストフード店' },
    { id: 4, name: 'カラオケボックス' },
    { id: 5, name: '漫画喫茶' },
    { id: 6, name: 'コワーキングスペース' },
    { id: 7, name: '図書館' },
    { id: 8, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :shops

end

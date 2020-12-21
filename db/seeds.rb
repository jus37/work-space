# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ジャンル登録
Genre.create!(name:"カフェ", image:"genres/genre_cafe.jpg")
Genre.create!(name:"コワーキングスペース", image:"genres/genre_coworkingspace.jpg")
Genre.create!(name:"カラオケボックス", image:"genres/genre_karaoke.jpg")
Genre.create!(name:"漫画喫茶", image:"genres/genre_manngakissa.jpg")
Genre.create!(name:"ファストフード店", image:"genres/genre_fastfood.jpg")
Genre.create!(name:"図書館")
Genre.create!(name:"その他")

# エリア登録
Area.create!(name:"梅田")
Area.create!(name:"難波")
Area.create!(name:"天王寺")
Area.create!(name:"新大阪")
Area.create!(name:"本町")
Area.create!(name:"堺")
Area.create!(name:"高槻")
Area.create!(name:"京橋")
Area.create!(name:"江坂")
Area.create!(name:"北浜")

# おすすめ登録
Characteristic.create!(name:"安い")
Characteristic.create!(name:"夜遅くまで営業")
Characteristic.create!(name:"早朝から営業")
Characteristic.create!(name:"静か")
Characteristic.create!(name:"席が広い")
Characteristic.create!(name:"雰囲気が良い")
Characteristic.create!(name:"カード可")
Characteristic.create!(name:"電子マネー可")
Characteristic.create!(name:"禁煙席あり")

# 店舗登録
# Shop.create(name:"", title:"", content:"", open_hour:"", regular_holiday:"", telephone:"", address:"", nearest_station:"", capacity:"", private_room:"", wifi:"", power_supply:"", genre_id:"", area_id:"")
Shop.create!(name:"スターバックスコーヒー NU茶屋町プラス店", title:"NU茶屋町にあるスタバ", content:"美味しい", open_hour:"9:00~22:00", regular_holiday:"日曜日", telephone:"0120444444", address:"大阪市北区", nearest_station:"阪急大阪梅田駅", capacity:"44席", private_room:"無", wifi:"有", power_supply:"有", genre_id:"1", area_id:"1")
Shop.create!(name:"wework LINKS UMEDA", title:"駅直結梅田のコワーキングスペース", content:"最高", open_hour:"9:00~18:00", regular_holiday:"土日", telephone:"0120117117", address:"〒530-0011 大阪府大阪市北区大深町１−１", nearest_station:"JR大阪駅", capacity:"150席", private_room:"有", wifi:"有", power_supply:"有", genre_id:"2", area_id:"1")

#店舗おすすめポイント登録
# ShopCaracteristic.create!(shop_id:"", characteristic_id:"")
ShopCaracteristic.create!(shop_id:"1", characteristic_id:"4")
ShopCaracteristic.create!(shop_id:"1", characteristic_id:"6")
ShopCaracteristic.create!(shop_id:"1", characteristic_id:"7")
ShopCaracteristic.create!(shop_id:"1", characteristic_id:"9")
ShopCaracteristic.create!(shop_id:"2", characteristic_id:"4")
ShopCaracteristic.create!(shop_id:"2", characteristic_id:"5")
ShopCaracteristic.create!(shop_id:"2", characteristic_id:"9")
#ユーザー登録
User.create!(name: 'ジャス', email: 'jus_37@outlook.jp', password: '123abc', password_confirmation: '123abc', telephone: "***REMOVED***",comment: "I'm master user", admin: "1")
User.create!(name: 'テストユーザ', email: 'test@com', password: '111111a', password_confirmation: '111111a', telephone: "00011112222", comment: "hello!", admin:"0")

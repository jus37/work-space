# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ジャンル登録
Genre.create(name:"カフェ")
Genre.create(name:"コワーキングスペース")
Genre.create(name:"カラオケボックス")
Genre.create(name:"漫画喫茶")
Genre.create(name:"ファストフード店")
Genre.create(name:"図書館")
Genre.create(name:"その他")

# エリア登録
Area.create(name:"梅田")
Area.create(name:"難波")
Area.create(name:"天王寺")
Area.create(name:"新大阪")
Area.create(name:"本町")
Area.create(name:"堺")
Area.create(name:"高槻")
Area.create(name:"京橋")
Area.create(name:"江坂")
Area.create(name:"北浜")

# おすすめ登録
Characteristic.create(name:"安い")
Characteristic.create(name:"夜遅くまで営業")
Characteristic.create(name:"早朝から営業")
Characteristic.create(name:"静か")
Characteristic.create(name:"席が広い")
Characteristic.create(name:"雰囲気が良い")
Characteristic.create(name:"カード可")
Characteristic.create(name:"電子マネー可")
Characteristic.create(name:"禁煙席あり")

# 店舗登録
# Shop.create()

User.create(name: 'ジャス', email: 'test037@com', password: '111111a', password_confirmation: '111111a', telephone: "0120444444",comment: "hello!")
User.create(name: 'テストユーザ', email: 'test@com', password: '111111a', password_confirmation: '111111a', telephone: "0120444444")

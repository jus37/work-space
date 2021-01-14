#   Character.create(name: 'Luke', movie: movies.first)
# ジャンル登録
Genre.create!(name:"カフェ", image:"genre_cafe.jpg")
Genre.create!(name:"コワーキングスペース", image:"genre_coworkingspace.jpg")
Genre.create!(name:"カラオケボックス", image:"genre_karaoke.jpg")
Genre.create!(name:"漫画喫茶", image:"genre_manngakissa.jpg")
Genre.create!(name:"ファストフード店", image:"genre_fastfood.jpg")
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

require "csv"
n=1

# 店舗登録
CSV.foreach('db/csv/shop.csv', headers: true) do |row|
  shop = Shop.new(
    name: row['name'],
    title: row['title'],
    content: row['content'],
    open_hour: row['open_hour'],
    regular_holiday: row['regular_holiday'],
    telephone: row['telephone'],
    address: row['address'],
    nearest_station: row['nearest_station'],
    capacity: row['capacity'],
    private_room: row['private_room'],
    wifi: row['wifi'],
    power_supply: row['power_supply'],
    genre_id: row['genre_id'],
    area_id: row['area_id']
  )
  shop_image1 = "db/images/shops/shop#{n}_1.jpg"
  shop_image2 = "db/images/shops/shop#{n}_2.jpg"
  shop_image3 = "db/images/shops/shop#{n}_3.jpg"
  shop.images.attach(io: File.open("#{Rails.root}/db/images/shops/shop#{n}_1.jpg"), filename: "shop#{n}_1.jpg", content_type: 'application/jpg') if File.exist?(shop_image1)
  shop.images.attach(io: File.open("#{Rails.root}/db/images/shops/shop#{n}_2.jpg"), filename: "shop#{n}_2.jpg", content_type: 'application/jpg') if File.exist?(shop_image2)
  shop.images.attach(io: File.open("#{Rails.root}/db/images/shops/shop#{n}_3.jpg"), filename: "shop#{n}_3.jpg", content_type: 'application/jpg') if File.exist?(shop_image3)
  shop.save!
  n += 1
end


#店舗おすすめポイント登録
CSV.foreach('db/csv/shop_caracteristic.csv', headers: true) do |row|
  ShopCaracteristic.create!(
    shop_id: row['shop_id'],
    characteristic_id: row['characteristic_id']
  )
end

#ユーザー登録
@user_master_password = ENV['WORK_SPACE_PASSWORD']

user_data = [
  {name: 'ジャス', email: 'jus_37@outlook.jp', password: @user_master_password, telephone: '00011112222', comment: "I'm master user", admin: "1"},
  {name: 'テストユーザ', email: 'test@com', password: '111111a', password_confirmation: '111111a', telephone: "00011112222", comment: "hello!", admin:"0"},
  {name: 'tomatomato', email: 'tomato@com', password: '111111a', password_confirmation: '111111a', telephone: "00011112222", comment: "大好物はトマト", admin:"0"},
  {name: 'yamato', email: 'yamato@com', password: '111111a', password_confirmation: '111111a', telephone: "00011112222", comment: "フリーランスで働いています！よろしくおねがいします！", admin:"0"},
  {name: 'yoko suzuki', email: 'suzuki@com', password: '111111a', password_confirmation: '111111a', telephone: "00011112222", comment: "働きやすいお店開拓中〜", admin:"0"}
]
user_data.length.times do |n|
  user = User.new(user_data[n])
  user.image.attach(io: File.open("#{Rails.root}/db/images/users/user#{n+1}.jpg"), filename: "user#{n+1}.jpg", content_type: 'application/jpg')
  user.save!
end

# レビュー投稿
CSV.foreach('db/csv/review.csv', headers: true) do |row|
  Review.create!(
    review_point: row['review_point'],
    title: row['title'],
    comment: row['comment'],
    date: row['date'],
    user_id: row['user_id'],
    shop_id: row['shop_id']
  )
end

# 保存clip
CSV.foreach('db/csv/clip.csv', headers: true) do |row|
  Clip.create!(
    user_id: row['user_id'],
    shop_id: row['shop_id']
  )
end


require 'rails_helper'

RSpec.describe Shop, type: :model do
  10.times do |n|
    Area.create(id: n+1, name: Faker::Lorem.word)
  end
  7.times do |n|
    Genre.create(id: n+1, name: Faker::Lorem.word)
  end

  before do
    @shop = FactoryBot.build(:shop)
  end
  describe '店舗登録機能' do
    context '店舗登録がうまくいくとき' do
      it '必要な項目がすべて正しく入力されている' do
        expect(@shop).to be_valid
      end
    end
    context '店舗登録がうまくいかないとき' do
      it '店舗名が空である' do
        @shop.name = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Name can't be blank")
      end
      it 'ジャンルが空である' do
        @shop.genre_id = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Genre can't be blank")
      end
      it 'ジャンル番号が存在しないものになっている' do
        @shop.genre_id = '100'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Genre must exist')
      end
      it 'エリアが空である' do
        @shop.area_id = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Area can't be blank")
      end
      it 'エリア番号が存在しないものになっている' do
        @shop.area_id = '100'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Area must exist')
      end
    end
  end
end

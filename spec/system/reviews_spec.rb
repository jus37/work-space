require 'rails_helper'

RSpec.describe 'レビュー投稿', type: :system do
  before do
    10.times do |n|
      Area.create(id: n + 1, name: Faker::Lorem.word)
    end
    7.times do |n|
      Genre.create(id: n + 1, name: Faker::Lorem.word)
    end

    @review = FactoryBot.build(:review)
    @user = FactoryBot.build(:user)
    @shop = FactoryBot.build(:shop)
    @user.save
    @shop.save
  end
  context 'ログインしたユーザーはレビュー投稿できる' do
    it '正しい情報を入力すればレビュー投稿ができてレビュー一覧ページに移動する' do
      # ログインする、パスでなくて直接URLを記入
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[class="sign-btn"]').click
      # 適当な店舗の詳細画面に移動する
      visit shop_path(@shop.id)
      # 詳細画面に「行った」ボタンがあることを確認する
      expect(page).to have_content('行った')
      # レビュー投稿画面へ移動する
      visit new_shop_review_path(@shop.id)
      # レビュー情報を入力する、実際に入力するものをいれたほうがいい
      find('#star').find("img[alt='5']").click
      fill_in 'review_title', with: @review.title
      fill_in 'review_comment', with: @review.comment
      fill_in 'review_date', with: @review.date
      # 送信ボタンを押すとレビューモデルのカウントが1上がることを確認する
      expect  do
        find('input[class="review-btn"]').click
      end.to change { Review.count }.by(1)
      # レビュー一覧画面へ遷移
      # 投稿したレビューが表示されているか確認する
      expect(page).to have_content(@review.title)
      expect(page).to have_content(@review.comment)
    end
  end
  context 'レビューが投稿できないとき' do
    it '誤った情報ではレビュー投稿ができずに投稿ページへ戻ってくる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[class="sign-btn"]').click
      # 適当な店舗の詳細画面に移動する
      visit shop_path(@shop.id)
      # 詳細画面に「行った」ボタンがあることを確認する
      expect(page).to have_content('行った')
      # レビュー投稿画面へ移動する
      visit new_shop_review_path(@shop.id)
      # レビュー情報を入力する
      # find('#star').find("img[alt='5']").click
      fill_in 'review_title', with: ''
      fill_in 'review_comment', with: ''
      fill_in 'review_date', with: ''
      # 送信ボタンを押してもレビューモデルのカウントが上がらないことを確認する
      expect  do
        find('input[class="review-btn"]').click
      end.to change { Review.count }.by(0)
      # レビュー投稿画面へ戻っていることを確認する
      expect(current_path).to eq(shop_reviews_path(@shop.id))
    end
    it 'ログインせずに投稿しようとしてログイン画面に戻ってくる' do
      # 適当な店舗の詳細画面に移動する
      visit shop_path(@shop.id)
      # 詳細画面に「行った」ボタンがあることを確認する
      expect(page).to have_content('行った')
      # レビュー投稿画面へ移動する
      visit new_shop_review_path(@shop.id)
      # ログイン画面に遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

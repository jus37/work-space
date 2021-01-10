require 'rails_helper'
# seleniumでドライバーを使う場合
# require 'selenium-webdriver'
# driver = Selenium::WebDriver.for :chrome

RSpec.describe "レビュー投稿", type: :system do
  before do
    @review = FactoryBot.build(:review)
    @user = FactoryBot.build(:user)
    @shop = FactoryBot.build(:shop)
    @user.save
    @shop.save
  end
  context 'ログインしたユーザーはレビュー投稿できる' do
    it '正しい情報を入力すればレビュー投稿ができてレビュー一覧ページに移動する' do
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
      find('#star').find("img[alt='5']").click
      fill_in 'review_title', with: @review.title
      fill_in 'review_comment', with: @review.comment
      fill_in 'review_date', with: @review.date
      # 送信ボタンを押すとレビューモデルのカウントが1上がることを確認する
      expect{
        find('input[class="review-btn"]').click
      }.to change {Review.count}.by(1)
      # レビュー一覧画面へ遷移
      # 投稿したレビューが表示されているか確認する
      expect(page).to have_content(@review.title)
      expect(page).to have_content(@review.comment)
    end
  end
  context 'レビューが投稿できないとき' do
    it '誤った情報ではレビュー投稿ができずに投稿ページへ戻ってくる' do
      # 適当な店舗の詳細画面に移動する
      # 詳細画面に「行った」ボタンがあることを確認する
      # レビュー投稿画面へ移動する
      # レビュー情報を入力する
      # 送信ボタンを押してもレビューモデルのカウントが上がらないことを確認する
      # レビュー投稿画面へ戻っていることを確認する
    end
  end
end

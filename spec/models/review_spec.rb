require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end
  describe 'レビュー投稿' do
    context 'レビュー投稿がうまくいくとき' do
      it '必須項目が全て正しく入力されている' do
        expect(@review).to be_valid
      end
    end
    context 'レビュー投稿がうまくいかないとき' do
      it '評価点数が空である' do
        @review.review_point = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Review point can't be blank", "Review point is not a number")
      end
      it '評価点数が1~5以外である' do
        @review.review_point = "100"
        @review.valid?
        expect(@review.errors.full_messages).to include("Review point must be less than or equal to 5")
      end
      it '投稿タイトルが空である' do
        @review.title = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Title can't be blank")
      end
      it '投稿した日付が空である' do
        @review.date = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Date can't be blank")
      end
    end
  end
end

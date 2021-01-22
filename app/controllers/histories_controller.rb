class HistoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    reviews = Review.where(user_id: @user.id)
    @shops = Shop.where(id: reviews.map{|review| review.shop_id})
  end
end

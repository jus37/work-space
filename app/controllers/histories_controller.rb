class HistoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @shops = Shop
              .includes(reviews: :user)
              .where(id: Review.where(user_id: @user.id).select(:shop_id))
  end
end

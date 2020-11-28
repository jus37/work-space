class ReviewsController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
  end

  def new
  end

  def create
  end

  def edit
  end

end

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item

  def index
    @reviews = @shop.reviews.includes(:user)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to shop_reviews_path(params[:shop_id])
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to shop_reviews_path(params[:shop_id])
    else
      render :index
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to shop_reviews_path(params[:shop_id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :review_point, :date).merge(user_id: current_user.id, shop_id: @shop.id)
  end

  def set_item
    @shop = Shop.find(params[:shop_id])
    @shop_rate = @shop.reviews.average(:review_point).round(1)
    @shop_count = @shop.reviews.count
    @clip = Clip.find_by(params[shop_id: @shop.id, user_id: current_user.id]) if user_signed_in?
  end
end

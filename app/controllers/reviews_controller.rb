class ReviewsController < ApplicationController
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
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :review_point, :date).merge(user_id: current_user.id, shop_id: @shop.id)
  end

  def set_item
    @shop = Shop.find(params[:shop_id])
    @shop_review = Review.all.sum(:review_point) / Review.count
    @shop_reviews = Review.count
  end

end

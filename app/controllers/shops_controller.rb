class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_review = Review.all.sum(:review_point) / Review.count
    @shop_reviews = Review.count
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :title, :content, :open_hour, :regular_holiday, :telephone, :address, :nearest_station, :capacity, :private_room, :characteristic_id, :genre_id, :area_id, images: [])
  end
end

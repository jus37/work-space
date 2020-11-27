class ShopsController < ApplicationController
  def index
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

  private

  def shop_params
    params.require(:shop).permit(:name, :title, :content, :open_hour, :regular_holiday, :telephone, :address, :nearest_station, :capacity, :private_room, :characteristic_id, :genre_id, :area_id, images: [])
  end

end

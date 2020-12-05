class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @top_genres = Genre.limit(5)
    @genres = Genre.all
    @top_areas = Area.limit(5)
    @areas = Area.all
    @top_characteristics = Characteristic.limit(5)
    @characteristics = Characteristic.all
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
    @clip = Clip.find_by(shop_id: params[:id], user_id: current_user.id)
    @shop_rate = @shop.reviews.average(:review_point)
    @shop_count = @shop.reviews.count
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
    @shop = Shop.find(params[:id])
    @shop.destroy
    @shop.reviews.destroy
    redirect_to root_path
  end

  def search
    @area = params.require(:q)[:area_name_eq]
    @genre = params.require(:q)[:genre_name_eq]
    @characteristic = params.require(:q)[:characteristics_name_eq]
    @area_form = params.require(:q)[:area_name_or_nearest_station_cont]
    @name_form = params.require(:q)[:name_or_genre_name_cont]
    end


  private

  def shop_params
    params.require(:shop).permit(
          :name, 
          :title, 
          :content, 
          :open_hour, 
          :regular_holiday,
          :telephone,
          :address,
          :nearest_station,
          :capacity,
          :private_room,
          :wifi,
          :power_supply,
          :genre_id,
          :area_id,
          images: [],
          characteristic_ids: []
    )
  end
end

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
    @q = Shop.search(search_params)
    # @shops = Shop.all if @q.name_or_title_cont == ""
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
          :genre_id,
          :area_id,
          images: [],
          characteristic_ids: []
                )
  end

  def search_params
    params.require(:q).permit!
  end

end

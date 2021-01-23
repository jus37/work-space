class ShopsController < ApplicationController
  def index
    @shops = Shop.with_attached_images.includes(:area, :genre, :shop_caracteristics, :characteristics, reviews: :user).page(params[:page]).per(5)
    @shops_count = Shop.all.count
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    if shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_rate = if @shop.reviews.present?
                   @shop.reviews.average(:review_point).round(1)
                 else
                   ''
                 end
    @shop_count = @shop.reviews.count
    @clip = Clip.find_by(shop_id: params[:id], user_id: current_user.id) if user_signed_in?
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    if shop.update(shop_params)
      redirect_to shop_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy!
    redirect_to root_path
  end

  def search
    @area = params.require(:q)[:area_name_eq]
    @genre = params.require(:q)[:genre_name_eq]
    @characteristic = params.require(:q)[:characteristics_name_eq]
    @area_form = params.require(:q)[:area_name_or_nearest_station_cont]
    @name_form = params.require(:q)[:name_or_genre_name_cont]
  end

  def map
    @shop = Shop.find(params[:id])
    @shop_rate = @shop.reviews.average(:review_point)
    @shop_count = @shop.reviews.count
    @clip = Clip.find_by(shop_id: params[:id], user_id: current_user.id) if user_signed_in?
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

class ClipsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @clips = Clip.where(params[user_id: @user.id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @clip = Clip.new(user_id: current_user.id, shop_id: @shop.id)
    if @clip.save
      redirect_to shop_path(@shop.id)
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @clip = Clip.find_by(shop_id: @shop.id, user_id:current_user.id)
    if @clip.destroy
      redirect_to shop_path(@shop.id)
    end
  end
end
class ClipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @user = User.find(params[:user_id])
    @clips = Clip.where(user_id: @user.id)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @clip = Clip.new(user_id: current_user.id, shop_id: @shop.id)
    redirect_to shop_path(@shop.id) if @clip.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @clip = Clip.find_by(shop_id: @shop.id, user_id: current_user.id)
    redirect_to shop_path(@shop.id) if @clip.destroy
  end
end

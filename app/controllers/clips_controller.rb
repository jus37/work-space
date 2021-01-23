class ClipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @user = User.find(params[:user_id])
    @shops = Shop.includes(clips: :user).where(id: Clip.where(user_id: @user.id).select(:shop_id))
  end

  def create
    shop = Shop.find(params[:shop_id])
    clip = Clip.new(user_id: current_user.id, shop_id: shop.id)
    clip.save!
    redirect_to shop_path(shop.id)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    clip = Clip.find_by(shop_id: shop.id, user_id: current_user.id)
    clip.destroy!
    redirect_to shop_path(shop.id)
  end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_item_search_query

  private

  def set_item_search_query
    @q = Shop.ransack(params[:q])
    @search_shops = @q.result(distinct: true).with_attached_images.includes(:area, :genre, :shop_caracteristics, :characteristics, reviews: :user).page(params[:page]).per(5)
    @search_shops_count = @q.result(distinct: true).count
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :telephone, :image, :comment])
  end
end

#gitkraken test
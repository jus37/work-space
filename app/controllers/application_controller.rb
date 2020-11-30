class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :telephone, :image, :comment])
  end
end

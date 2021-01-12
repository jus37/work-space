class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end

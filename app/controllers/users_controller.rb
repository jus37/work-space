class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new_guest
    user = User.guest
    sign_in user
    flash[:new_guest] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end

end

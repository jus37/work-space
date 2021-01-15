class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def new_guest
    user = User.guest
    sign_in user
    flash[:new_guest] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end

end

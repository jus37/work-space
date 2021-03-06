class UserRegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: [:destroy, :update]

  private

  def check_guest
    return unless resource.email == 'test@com'

    flash[:top_message] = 'ゲストユーザーは編集・削除できません'
    redirect_to root_path
  end
end

class UserRegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: [:destroy, :update]

  def check_guest
    if resource.email == 'test@com'
      redirect_to root_path, alert: "ゲストユーザーは編集・削除できません"
    end
  end

end
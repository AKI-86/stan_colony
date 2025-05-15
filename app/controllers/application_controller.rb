class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #ログイン前の制限をかけている
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :age])
  end

   
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when User
      users_mypage_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      admin_path
    when User
      root_path
    else
      root_path
    end
  end
end

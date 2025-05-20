class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #ログイン前の制限をかけている
  before_action :authenticate_any!
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  protected

  def authenticate_any!
    # ログインページやログアウトなどは認証不要
    return if devise_controller? && ['sessions', 'passwords', 'registrations'].include?(controller_name)
  
    if user_signed_in?
      # OK
    elsif admin_signed_in?
      # OK
    else
      if request.path.starts_with?('/admin')
        redirect_to new_admin_session_path, alert: "管理者ログインしてください"
      else
        redirect_to new_user_session_path, alert: "ログインしてください"
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :age])
  end

   
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path
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

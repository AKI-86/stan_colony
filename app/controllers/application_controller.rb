class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # deviseで保存できる情報の追加
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

  # Deviseのauthenticate_user!をカスタマイズ
  def authenticate_user!
    unless user_signed_in?
      flash[:alert] = "ログインが必要です。"
      redirect_to new_user_session_path
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :basic_auth, if: :production?  # 本番用のbasic認証機能
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :last_name_kanji,
      :first_name_kanji,
      :last_name_kana,
      :first_name_kana,
      :birthday,
      :current_address,
      :delivery_address,
      :sex,
      :tel_number,
      :profile_text,
      :profile_image
    ])
  end
end
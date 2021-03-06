class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :basic_auth, if: :production?  # 本番用のbasic認証機能
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_category

  protected

  def load_category
    @parents = Category.where(ancestry: nil)
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :last_name_kanji,
      :first_name_kanji,
      :last_name_kana,
      :first_name_kana,
      :birthday,
      :sex,
      :tel_number,
      :certification_number,
      :profile_text,
      :profile_image
    ])
  end
end
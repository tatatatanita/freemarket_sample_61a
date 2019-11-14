class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
  end

  def show_exhibit
    @products = User.find(params[:id]).saling_products  # ログイン中のユーザが現在売っている商品
  end

  def edit
    @user = User.find(params[:id])
    # @user.delivery_addresses.build
    render "users/#{params[:name]}", locals: {user: current_user }
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
    :email,
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
    :profile_image,
    :postal_code,
    :prefectures,
    :city,
    :address,
    :building,
    delivery_addresses_attributes: [:user_id, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :city, :address, :building, :tel_number])
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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
    :profile_image)
  end
end

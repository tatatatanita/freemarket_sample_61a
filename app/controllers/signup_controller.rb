class SignupController < ApplicationController
  def step1
    @user = User.new
    @user.delivery_addresses.build
    @user.build_credit_info
    # @snsusername = session["devise.provider_data"]["info"]["name"]
    # @snsuseremail = session["devise.provider_data"]["info"]["email"]
  end
  
  def step2
    params[:user][:birthday] = birthday_join
    session[:user_params_after_step1] = user_params
    @user = User.new
    @user.delivery_addresses.build
    @user.build_credit_info
    
  end

  def step3
    session[:user_params_after_step2] = user_params
    session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new
    @user.delivery_addresses.build
    @user.build_credit_info
  end

  def step4
    session[:delivery_addresses_attributes] = user_params[:delivery_addresses_attributes]
    @user = User.new
    @user.delivery_addresses.build
    @user.build_credit_info
  end
  
  def create
    @user = User.new(session[:user_params_after_step2])
    @user.delivery_addresses.build(session[:delivery_addresses_attributes]["0"])
    @user.build_credit_info(user_params[:credit_info_attributes])
    # @user.uid = session["devise.provider_data"]["uid"]
    # @user.provider = session["devise.provider_data"]["provider"]

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to products_path
  end
  private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :last_name_kanji,
        :first_name_kanji,
        :last_name_kana,
        :first_name_kana,
        :tel_number,
        :birthday,
        delivery_addresses_attributes: [:user_id, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :city, :address, :building],
        credit_info_attributes: [:user_id, :number, :limit, :security_code]
      )
    end
    def birthday_join
      date = params[:birthday]
      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end
      Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end
end





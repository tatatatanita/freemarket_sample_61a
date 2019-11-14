class SignupController < ApplicationController
  require "payjp"
  before_action :set_card, except: [:step1, :step2, :step3, :step4, :create, :done]
  def step1
    @user = User.new 
  end
  
  def step2
    params[:user][:birthday] = birthday_join
    session[:user_params_after_step1] = user_params
    @user = User.new
  end

  def step3
    session[:user_params_after_step2] = user_params
    session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new
    @user.build_delivery_address
  end

  def step4
    session[:delivery_address_attributes] = user_params[:delivery_address_attributes]
    @user = User.new
    @user.build_delivery_address
  end
  
  def create
    @user = User.new(session[:user_params_after_step2])
    @user.build_delivery_address(session[:delivery_address_attributes])


    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']

    if params['payjp-token'].blank?
      redirect_to action: "step4"
    else
      customer = Payjp::Customer.create(
        description: 'test', 
        card: params['payjp-token'], 
        metadata: :user_id
      )
    end
    if @user.save
      @card = CreditInfo.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
      session[:id] = @user.id
      if @card.save
        redirect_to controller: :signup, action: :done
      else
        render '/signup/step1'
      end
    else
      render '/signup/step1'
    end
    
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to products_path
  end

  def edit
    @card = CreditInfo.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def update

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
        delivery_address_attributes: [:user_id, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :city, :address, :building],
      )
    end

    def birthday_join
      date = params[:birthday]
      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end
      Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end

    def set_card
      @card = CreditInfo.where(user_id: current_user.id).first if CreditInfo.where(user_id: current_user.id).present?
    end
end






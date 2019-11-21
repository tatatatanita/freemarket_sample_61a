class SignupController < ApplicationController
  require "payjp"
  before_action :set_card, except: [:step1, :step2, :step3, :step4, :create, :done]
  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3
  # before_action :save_step3_to_session, only: :step4
  def step1
    @user = User.new

    # @snsusername = session["devise.provider_data"]["info"]["name"]
    # @snsuseremail = session["devise.provider_data"]["info"]["email"]

    @user.build_credit_info
    if session["devise.provider_data"] != nil
      @snsusername = session["devise.provider_data"]["info"]["name"]
      @snsuseremail = session["devise.provider_data"]["info"]["email"]
    end

  end
  
  def save_step1_to_session
    params[:user][:birthday] = birthday_join
    session[:user_params_after_step1] = user_params
    # @user = User.new(params[:user][:birthday])
    @user = User.new(session[:user_params_after_step1])
    render '/signup/step1' unless @user.valid?(:save_step1_to_session)
  end

  def step2
    # params[:user][:birthday] = birthday_join
    # session[:user_params_after_step1] = user_params
    @user = User.new
  end

  def save_step2_to_session
    session[:user_params_after_step2] = user_params
    session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new(session[:user_params_after_step2])
    render '/signup/step2' unless @user.valid?(:save_step2_to_session)
  end

  def step3
    # session[:user_params_after_step2] = user_params
    # session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new
    @user.build_delivery_address
  end

  # def save_step3_to_session
  #   session[:delivery_address_attributes] = user_params[:delivery_address_attributes]
  #   @user = User.new
  #   @user.build_delivery_address(session[:delivery_address_attributes])
  #   deli = DeliveryAddress.new(session[:delivery_address_attributes])
  #   # binding.pry
  #   render '/signup/step3' unless deli.valid?(:save_step3_to_session)
  # end
  def step4
    session[:delivery_address_attributes] = user_params[:delivery_address_attributes]
    @user = User.new
    @user.build_delivery_address
  end
  
  def create
    @user = User.new(session[:user_params_after_step2])
    @user.build_delivery_address(session[:delivery_address_attributes])
    
    if session["devise.provider_data"] != nil
      @user.uid = session["devise.provider_data"]["uid"]
      @user.provider = session["devise.provider_data"]["provider"]
    end

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

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
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






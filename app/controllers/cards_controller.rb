
# class CardsController < ApplicationController
#   require "payjp"
#   before_action :set_card, except: [:new, :create, :index]

#   def index
#   end

#   def new
    
#   end
  
#   def create
#     Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
#     if params['payjp-token'].blank?
#       redirect_to action: "new"
#     else
#       customer = Payjp::Customer.create(
#         description: 'test', 
#         email: current_user.email,
#         card: params['payjp-token'], 
#         metadata: {user_id: current_user.id} 
#       )
#       @card = CreditInfo.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
#       if @card.save
#         redirect_to controller: :signup, action: :done
#       else
#         redirect_to action: "create"
#       end
#     end
#   end

#   def edit
#     card = CreditInfo.where(user_id: current_user.id).first
#     redirect_to action: "index" if card.present?
#   end

#   def update

#   end

#   private

#   def set_card
#     @card = CreditInfo.where(user_id: current_user.id).first if CreditInfo.where(user_id: current_user.id).present?
#   end
# end

    
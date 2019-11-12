class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         
         def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
       
          unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              email:    auth.info.email,
              password: Devise.friendly_token[0, 20]
            )
          end
       
          user
        end

  has_many :delivery_addresses, class_name: 'DeliveryAddress'
  accepts_nested_attributes_for :delivery_addresses
  has_one :credit_info, class_name: 'CreditInfo'
  accepts_nested_attributes_for :credit_info

 
  has_many :products
 
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"

end

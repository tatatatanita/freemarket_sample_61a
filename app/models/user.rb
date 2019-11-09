class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_addresses, class_name: 'DeliveryAddress'
  accepts_nested_attributes_for :delivery_addresses
  has_one :credit_info, class_name: 'CreditInfo'
  accepts_nested_attributes_for :credit_info

 
  has_many :products
 
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"

end

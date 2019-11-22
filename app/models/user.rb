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

  has_one :delivery_address, class_name: 'DeliveryAddress'
  accepts_nested_attributes_for :delivery_address
  has_one :credit_info, class_name: 'CreditInfo'

 
  has_many :products
 
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :save_step1_to_session
  validates :nickname,                presence: true, length: {maximum: 20}, on: :save_step1_to_session
  validates :password,                presence: true, length: {minimum: 6, maximum: 128}, on: :save_step1_to_session
  validates :last_name_kanji,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}, on: :save_step1_to_session
  validates :first_name_kanji,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}, on: :save_step1_to_session
  validates :last_name_kana,          presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}, on: :save_step1_to_session
  validates :first_name_kana,         presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}, on: :save_step1_to_session
  validates :birthday,                presence: true, on: :save_step1_to_session
  validates :tel_number,              presence: true, format: {with: /\A\d{10,11}\z/}, on: :save_step2_to_session
end

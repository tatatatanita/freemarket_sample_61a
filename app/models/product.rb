class Product < ApplicationRecord
  
  # belongs_to :user, foreign_key: 'user_id'
  # belongs_to :category
  
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  has_many :images, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :images
end

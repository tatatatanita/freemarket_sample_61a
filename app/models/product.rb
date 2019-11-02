class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end

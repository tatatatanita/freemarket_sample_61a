class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end

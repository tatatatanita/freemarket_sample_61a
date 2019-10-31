class Product < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  mount_uploader :image, ImageUploader
end

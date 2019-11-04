class Product < ApplicationRecord
  
  # belongs_to :category　カテゴリー実装じにコメントアウト外す
  
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true

  has_many :images, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :images
end

class Product < ApplicationRecord

  
  belongs_to :user, optional: true
  
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true

  has_one :condition, dependent: :destroy 
  accepts_nested_attributes_for :condition

  has_one :freight, dependent: :destroy 
  accepts_nested_attributes_for :freight

  has_one :root_area, dependent: :destroy 
  accepts_nested_attributes_for :root_area

  has_one :day, dependent: :destroy 
  accepts_nested_attributes_for :day

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :images, presence: true
  serialize :categories, JSON

  validates :image_url, presence: true

end

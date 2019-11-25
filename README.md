# 開発環境
- Ruby 2.5.1
- Rails 5.2.3


# DB設計

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- has_many :products
- has_ancestry



## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|integer|null: false|
|product_id|bigint||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :product



## credit_infosテーブル
|Column|Type|Options|
|------|----|———|
|user_id|bigint||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user, class_name: 'User'



## daysテーブル
|Column|Type|Options|
|------|----|-------|
|day|integer|null: false|
|product_id|bigint|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :product



## delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name_kanji|string|null: false|
|last_name_kanji|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|user_id|bigint||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|tel_number|string||

### Association
- belongs_to :user, class_name: 'User'



## freightsテーブル
|Column|Type|Options|
|------|----|-------|
|freight|integer|null: false|
|product_id|bigint|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :product



## imagesテーブル
|Column|Type|Options|
|------|----|———|
|image_url|string|null: false|
|product_id|bigint|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :product, inverse_of: :images



## productsテーブル
|Column|Type|Options|
|------|----|-------|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|title|text|null: false|
|text|text||
|price|integer|null: false|
|saler_id|integer||
|buyer_id|integer||
|categories|text||

### Association
- belongs_to :user, optional: true
- belongs_to :saler, class_name: "User", optional: true
- belongs_to :buyer, class_name: "User", optional: true
- has_one :condition, dependent: :destroy 
- accepts_nested_attributes_for :condition
- has_one :freight, dependent: :destroy 
- accepts_nested_attributes_for :freight
- has_one :root_area, dependent: :destroy 
- accepts_nested_attributes_for :root_area
- has_one :day, dependent: :destroy 
- accepts_nested_attributes_for :day
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images



## root_areasテーブル
|Column|Type|Options|
|------|----|-------|
|root_area|text|null: false|
|product_id|bigint|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :product



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|sex|integer| |
|tel_number|string|null:false|
|profile_text|text| |
|profile_image|text| |
|email|string|null: false|
|encrypted_password|string|null:false|
|reset_password_token|string||
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|certification_number|integer||
|postal_code|integer||
|prefectures|integer||
|city|string||
|address|string||
|building|string||

### Association
- has_one :delivery_address, class_name: 'DeliveryAddress'
- accepts_nested_attributes_for :delivery_address
- has_one :credit_info, class_name: 'CreditInfo'
- has_many :products
- has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
- has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"
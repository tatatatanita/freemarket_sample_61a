# 開発環境
- Ruby 2.5.1
- Rails 5.2.3

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirm|string|null: false|
|first_name_kanji|string|null: false|
|last_name_kanji|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|sex|integer| |
|tel_number|integer|null:false|
|certification_number|integer|null:false|
|profile_text|text| |
|profile_image|text| |

### Association
- has_many :credit_infos
- has_many :current_addresses
- has_many :delivery_addresses
- has_many :products
- has_many :comments
- has_many :likes
- has_many :liked_products, through: :likes, source: :product
- has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
- has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"


## credit_infosテーブル

|Column|Type|Options|
|------|----|———|
|number|integer|null: false|
|limit|integer|null:false|
|security_code|integer|null:false|
|user_id|references|foreign_key:true|

### Association
- belongs_to :user


## current_addressテーブル

|Column|Type|Options|
|------|----|-------|
|current_address_postal_code|integer|null: false|
|current_address_prefectures|integer|null: false|
|current_address_city|string|null: false|
|current_address_address|string|null: false|
|current_address_building|string| |
|user_id|references|foreign_key:true|

### Association
- belongs_to :user


## delivery_addressテーブル

|Column|Type|Options|
|------|----|-------|
|delivery_address_postal_code|integer|null: false|
|delivery_address_prefectures|integer|null: false|
|delivery_address_city|string|null: false|
|delivery_address_address|string|null: false|
|delivery_address_building|string| |
|user_id|references|foreign_key:true|

### Association
- belongs_to :user


## productsテーブル

|Column|Type|Options|
|------|----|———|
|title|text|null:false, index:true|
|text|text| |
|price|integer|null: false|
|user_id|references|foreign_key:true|
|buyer_id|integer||
|saler_id|integer||

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :condition
- has_one :freight
- has_one :root_area
- has_one :day
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :images, inverse_of: :product, dependent: :destroy
- accepts_nested_attributes_for :images


## imagesテーブル
|Column|Type|Options|
|------|----|———|
|image_url|string|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs_to :product, inverse_of: :images


## commentsテーブル

|Column|Type|Options|
|------|----|———|
|comment|text|null: false|
|product_id|references|foreign_key:true|
|user_id|references|foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product


## likesテーブル

|Column|Type|Options|
|------|----|———|
|product_id|references|foreign_key:true|
|user_id|references|foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product
- validates_uniqueness_of :product_id, scope: :user_id


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item|integer|null: false|
|ancestry|string|index:true|

### Association
- has_many  :products


## brandsテーブル

|Column|Type|Options|
|------|----|———|
|brand|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- has_many  :products


## conditionsテーブル

|Column|Type|Options|
|------|----|———|
|condition|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs_to :product


## freightsテーブル

|Column|Type|Options|
|------|----|———|
|freight|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs_to :product


## root_areasテーブル

|Column|Type|Options|
|------|----|———|
|root_area|text|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs_to :product


## daysテーブル

|Column|Type|Options|
|------|----|———|
|days|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs_to :product
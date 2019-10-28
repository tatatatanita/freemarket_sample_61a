# 開発環境
- Ruby 2.5.1
- Rails 5.2.3

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail_address|string|null: false|
|password|string|null: false|
|password_confirm|string|null: false|
|first_name_kanji|string|null: false|
|last_name_kanji|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|current_address|text| |
|delivery_address_postal_code|integer|null: false|
|delivery_address_prefectures|integer|null: false|
|delivery_address_city|string|null: false|
|delivery_address_address|string|null: false|
|delivery_address_building|string| |
|sex|integer| |
|tel_number|integer|null:false, (unique: ture)|
|certification_number|integer|null:false, (unique: ture)|
|profile_text|text| |
|profile_image|text| |

### Association
- belongs to :credit_infos
- has_many :products
- has_many :comments
- has_many :likes
- has_many :rates


## credit_infosテーブル

|Column|Type|Options|
|------|----|———|
|number|integer|null: false|
|limit|integer|null:false|
|security_code|integer|null:false|
|user_id|references|foreign_key:true|

### Association
- belongs to :users


## productsテーブル

|Column|Type|Options|
|------|----|———|
|image|string|null: false|
|title|text|null:false, index:true|
|text|text| |
|price|integer|null: false|

### Association
- belongs to :users
- belongs to :large_categories
- belongs to :brands
- belongs to :conditions
- belongs to :freights
- belongs to :root_areas
- belongs to :days
- has_many :comments
- has_many :likes
- has_many :rates


## commentsテーブル

|Column|Type|Options|
|------|----|———|
|comment|text|null: false|
|product_id|references|foreign_key:true|
|user_id|references|foreign_key:true|

### Association
- belongs to :users
- belongs to :products


## likesテーブル

|Column|Type|Options|
|------|----|———|
|product_id|references|foreign_key:true|
|user_id|references|foreign_key:true|

### Association
- belongs to :users
- belongs to :products


## ratesテーブル

|Column|Type|Options|
|------|----|———|
|rate|integer|null: false|
|product_id|references|foreign_key:true|
|user_id|references|foreign_key:true|

### Association
- belongs to :users
- belongs to :products


## large_categoriesテーブル

|Column|Type|Options|
|------|----|———|
|large_item|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs to :products
- has_many :middle_categories


## middle_categoriesテーブル

|Column|Type|Options|
|------|----|———|
|middle_item|integer|null: false|
|lc_id|references|foreign_key:true|

### Association
- belongs to : large_categories
- has_many :small_categories


## small_categoriesテーブル

|Column|Type|Options|
|------|----|———|
|small_item|integer|null: false|
|mc_id|references|foreign_key:true|

### Association
- belongs to :middlel_categories


## brandsテーブル

|Column|Type|Options|
|------|----|———|
|brand|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs to :products


## conditionsテーブル

|Column|Type|Options|
|------|----|———|
|condition|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs to :products


## freightsテーブル

|Column|Type|Options|
|------|----|———|
|freight|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs to :products


## root_areasテーブル

|Column|Type|Options|
|------|----|———|
|root_area|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs to :products


## daysテーブル

|Column|Type|Options|
|------|----|———|
|days|integer|null: false|
|product_id|references|foreign_key:true|

### Association
- belongs to :products
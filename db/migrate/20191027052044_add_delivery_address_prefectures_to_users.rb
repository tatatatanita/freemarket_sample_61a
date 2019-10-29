class AddDeliveryAddressPrefecturesToUsers < ActiveRecord::Migration[5.2]
  def change
    
    add_column :users, :delivery_address_prefectures,   :integer,    null: false
    add_column :users, :delivery_address_city,          :string,     null: false
    add_column :users, :delivery_address_address,       :string,     null: false
    add_column :users, :delivery_address_building,      :string
  end
end

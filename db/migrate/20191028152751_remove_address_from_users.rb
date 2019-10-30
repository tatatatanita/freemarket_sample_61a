class RemoveAddressFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :current_address, :text
    remove_column :users, :delivery_address_postal_code, :integer
    remove_column :users, :delivery_address_prefectures,   :integer
    remove_column :users, :delivery_address_city,          :string
    remove_column :users, :delivery_address_address,       :string
    remove_column :users, :delivery_address_building,      :string   
  end
end

class RemoveAddressFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :delivery_address_prefectures, :integer, null: false
    remove_column :users, :delivery_address_city, :string, null: false
    remove_column :users, :delivery_address_address, :string, null: false
    remove_column :users, :delivery_address_building, :string, null: false
  end
end

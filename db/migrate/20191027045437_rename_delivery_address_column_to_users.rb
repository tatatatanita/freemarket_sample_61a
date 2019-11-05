class RenameDeliveryAddressColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :delivery_address, :delivery_address_postal_code
  end
end 
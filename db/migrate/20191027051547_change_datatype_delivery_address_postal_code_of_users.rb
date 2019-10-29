class ChangeDatatypeDeliveryAddressPostalCodeOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :delivery_address_postal_code, :integer
  end
end

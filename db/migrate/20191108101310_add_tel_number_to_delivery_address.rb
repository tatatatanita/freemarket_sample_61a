class AddTelNumberToDeliveryAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_addresses, :tel_number, :integer
  end
end

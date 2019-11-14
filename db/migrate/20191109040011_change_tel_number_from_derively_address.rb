class ChangeTelNumberFromDerivelyAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :delivery_addresses, :tel_number, :string
  end
end

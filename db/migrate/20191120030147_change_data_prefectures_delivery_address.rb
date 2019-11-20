class ChangeDataPrefecturesDeliveryAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :delivery_addresses, :prefectures, :string
  end
end

class ChangePrefecturesInDeliveryAddress < ActiveRecord::Migration[5.2]
  def change
    change_column_default :delivery_addresses, :prefectures, nil
  end
end

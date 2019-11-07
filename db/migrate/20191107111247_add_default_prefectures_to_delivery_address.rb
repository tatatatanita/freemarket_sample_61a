class AddDefaultPrefecturesToDeliveryAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :delivery_addresses, :prefectures, :integer, :default => 0
  end
end

class AddCustomerIdToCreditInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_infos, :customer_id, :string, null: false
    add_column :credit_infos, :card_id, :string, null: false
  end
end

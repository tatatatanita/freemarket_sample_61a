class AddSalerIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :saler_id, :integer
  end
end

class ChangeDatatypeImageOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :image, :text
  end
end

class AddTextToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :text, :text
  end
end

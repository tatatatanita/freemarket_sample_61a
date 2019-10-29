class AddTitleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :title, :text, null:false, index: true
  end
end

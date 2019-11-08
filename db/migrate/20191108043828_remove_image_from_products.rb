class RemoveImageFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image, :string, null: false
  end
end

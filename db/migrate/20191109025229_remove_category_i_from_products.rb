class RemoveCategoryIFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :categories, foreign_key: true
  end
end

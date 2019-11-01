class RenameItemColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :item, :name
  end
end

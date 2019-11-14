class ChangeDataRootAreaToRootAreas < ActiveRecord::Migration[5.2]
  def change
    change_column :root_areas, :root_area, :text
  end
end

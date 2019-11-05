class CreateRootAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :root_areas do |t|
      t.integer :root_area, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

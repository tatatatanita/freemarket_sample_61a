class CreateFreights < ActiveRecord::Migration[5.2]
  def change
    create_table :freights do |t|
      t.integer :freight, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

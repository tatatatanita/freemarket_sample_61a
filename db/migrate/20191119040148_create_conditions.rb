class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :condition, null: false
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end

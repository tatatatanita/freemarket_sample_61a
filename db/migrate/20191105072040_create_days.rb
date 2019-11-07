class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.integer :day, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

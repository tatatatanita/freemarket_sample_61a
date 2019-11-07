class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string "image_url", null: false
      t.bigint "product_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end

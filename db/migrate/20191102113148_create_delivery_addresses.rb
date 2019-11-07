class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.string :first_name_kanji,        null: false
      t.string :last_name_kanji,         null: false
      t.string :first_name_kana,         null: false
      t.string :last_name_kana,          null: false
      t.integer :postal_code,            null: false
      t.integer :prefectures,            null: false
      t.string :city,                    null: false
      t.string :address,                 null: false
      t.string :building
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

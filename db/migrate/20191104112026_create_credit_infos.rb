class CreateCreditInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_infos do |t|
      t.integer :number,                         null: false
      t.date :limit,                             null: false
      t.integer :security_code,                  null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

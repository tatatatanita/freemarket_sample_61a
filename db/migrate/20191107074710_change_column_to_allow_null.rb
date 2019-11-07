class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :certification_number,:integer, null: true
  end

  def down
    change_column :users, :certification_number,:integer, null: false
  end
end

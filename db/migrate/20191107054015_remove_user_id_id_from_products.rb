class RemoveUserIdIdFromProducts < ActiveRecord::Migration[5.2]
  def down
    remove_column :products, :user_id_id, :references
  end
end

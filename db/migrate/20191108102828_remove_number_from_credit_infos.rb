class RemoveNumberFromCreditInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_infos, :number, :integer, null: false
    remove_column :credit_infos, :limit, :date, null: false
    remove_column :credit_infos, :security_code, :integer, null: false
  end
end

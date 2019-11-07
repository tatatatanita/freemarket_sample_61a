class AddCertificationNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :certification_number, :integer,  null: false
  end
end

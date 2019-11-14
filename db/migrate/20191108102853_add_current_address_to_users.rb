class AddCurrentAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :prefectures, :integer
    add_column :users, :city,        :string
    add_column :users, :address,     :string
    add_column :users, :building,    :string
  end
end

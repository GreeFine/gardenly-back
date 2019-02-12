class AddUserInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :phone_number, :string
  end
end

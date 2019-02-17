class AddDescToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :description, :string
  end
end

class AddCityToGarden < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :city, :string
  end
end

class AddCountryToGarden < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :country, :string
  end
end

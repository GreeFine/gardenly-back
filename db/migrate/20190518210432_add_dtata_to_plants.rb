class AddDtataToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :description, :string
    add_column :plants, :tips, :string
    add_column :plants, :model, :integer
  end
end

class AddDataToPlantTiles < ActiveRecord::Migration[5.2]
  def change
    add_column :plant_tiles, :age, :datetime
    add_column :plant_tiles, :sun_exposition, :float
    add_column :plant_tiles, :position, :integer, array: true
  end
end

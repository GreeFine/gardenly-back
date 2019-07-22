class AddKeyToPlantTiles < ActiveRecord::Migration[5.2]
  def change
    add_column :plant_tiles, :key, :integer
  end
end

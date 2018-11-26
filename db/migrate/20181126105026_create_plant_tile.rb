class CreatePlantTile < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_tiles do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.timestamps
    end

    add_reference :plant_tiles, :plant, index: true
    add_reference :plant_tiles, :tile, index: true
  end
end

class FixStaticElem < ActiveRecord::Migration[5.2]
  def change
    remove_column :static_elements, :position
    remove_column :static_elements, :rotation
    add_column :static_elements, :data, :json

    remove_column :plant_tiles, :position
    add_column :plant_tiles, :data, :json
  end
end

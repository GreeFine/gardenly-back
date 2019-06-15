class FixTiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :tiles, :points
    add_column :tiles, :data, :json
  end
end

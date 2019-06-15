class AddKeyToTiles < ActiveRecord::Migration[5.2]
  def change
    add_column :tiles, :key, :integer
  end
end

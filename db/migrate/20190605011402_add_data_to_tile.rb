class AddDataToTile < ActiveRecord::Migration[5.2]
  def change
    add_column :tiles, :points, :json
    add_column :tiles, :name, :string
    add_reference :tiles, :ground_type, type: :uuid, index: true
  end
end

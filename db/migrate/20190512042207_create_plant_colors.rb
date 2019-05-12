class CreatePlantColors < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_colors do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.belongs_to :plant, type: :uuid, index: true
      t.belongs_to :color, type: :uuid, index: true

      t.timestamps
    end

    remove_column :plants, :color
  end
end

class CreateShapes < ActiveRecord::Migration[5.2]
  def change
    create_table :shapes do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :name

      t.timestamps
    end

    create_table :plant_shapes do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.belongs_to :plant, index: true, type: :uuid
      t.belongs_to :shape, index: true, type: :uuid

      t.timestamps
    end
  end
end

class CreateGroundTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :ground_types do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :name
      t.timestamps
    end

    create_table :plant_ground_types do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.belongs_to :plant, index: true, type: :uuid
      t.belongs_to :ground_type, index: true, type: :uuid

      t.timestamps
    end
  end
end

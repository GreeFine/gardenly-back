class CreateTerrains < ActiveRecord::Migration[5.2]
  def change
    create_table :terrains do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.timestamps
    end

    add_reference :terrains, :tile, index: true
  end
end

class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name, required: true
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.timestamps
    end
  end
end

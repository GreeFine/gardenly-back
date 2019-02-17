class CreateLunarCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :lunar_cycles do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.json :data, null: false
      t.integer :year, null: false

      t.timestamps
    end
  end
end

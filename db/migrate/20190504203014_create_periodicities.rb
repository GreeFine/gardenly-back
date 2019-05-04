class CreatePeriodicities < ActiveRecord::Migration[5.2]
  def change
    create_table :periodicities do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :name

      t.timestamps
    end

    create_table :plant_periodicities do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.belongs_to :plant, index: true, type: :uuid
      t.belongs_to :periodicities, index: true, type: :uuid

      t.timestamps
    end
  end
end

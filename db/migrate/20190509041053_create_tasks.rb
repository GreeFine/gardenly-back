class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.belongs_to :garden, type: :uuid, index: true
      t.belongs_to :plant_tile, type: :uuid, index: true
      t.string :status, default: "New"
      t.datetime :start_date
      t.datetime :end_date
      t.string :body
      t.boolean :public, default: false

      t.timestamps
    end
  end
end

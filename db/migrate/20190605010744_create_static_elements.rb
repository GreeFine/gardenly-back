class CreateStaticElements < ActiveRecord::Migration[5.2]
  def change
    create_table :static_elements do |t|
      t.float :position, array: true
      t.float :rotation, array: true
      t.float :scale, array: true, optional: true
      t.integer :key
      t.integer :type
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.belongs_to :garden, type: :uuid, index: true

      t.timestamps
    end
  end
end

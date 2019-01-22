class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.integer :width
      t.integer :height
      t.integer :size
      t.string :title

      t.timestamps
    end

    add_column :media, :user_id, :uuid
  end
end

class Relations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.uuid :user_id, null: false
      t.uuid :friend_id, null: false
      t.integer :state, null: false
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.timestamps
    end

    drop_table :user_relations
  end
end

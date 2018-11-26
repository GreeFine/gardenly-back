class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.text :body, required: true
      t.timestamps
    end

    add_reference :notifications, :user, index: true
  end
end

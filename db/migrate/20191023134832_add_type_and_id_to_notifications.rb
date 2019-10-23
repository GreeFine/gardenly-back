class AddTypeAndIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :object_type, :string
    add_column :notifications, :object_type_id, :uuid
  end
end

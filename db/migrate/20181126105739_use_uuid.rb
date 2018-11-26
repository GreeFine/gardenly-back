class UseUuid < ActiveRecord::Migration[5.2]
  def change
    remove_column :garden_users, :user_id
    remove_column :garden_users, :garden_id
    remove_column :moderators, :user_id
    remove_column :notifications, :user_id
    remove_column :plant_tiles, :plant_id
    remove_column :plant_tiles, :tile_id
    remove_column :sessions, :user_id
    remove_column :settings, :user_id
    remove_column :terrains, :tile_id
    remove_column :tiles, :garden_id

    add_column :garden_users, :user_id, :uuid
    add_column :garden_users, :garden_id, :uuid
    add_column :moderators, :user_id, :uuid
    add_column :notifications, :user_id, :uuid
    add_column :plant_tiles, :plant_id, :uuid
    add_column :plant_tiles, :tile_id, :uuid
    add_column :sessions, :user_id, :uuid
    add_column :settings, :user_id, :uuid
    add_column :terrains, :tile_id, :uuid
    add_column :tiles, :garden_id, :uuid
  end
end

class AddNotifReadToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notifications_last_read, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

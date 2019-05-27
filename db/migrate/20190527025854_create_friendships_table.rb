# frozen_string_literal: true

class CreateFriendshipsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships, id: false do |t|
      t.uuid :user_id
      t.uuid :friend_user_id
    end

    add_index(:friendships, %i[user_id friend_user_id], unique: true)
    add_index(:friendships, %i[friend_user_id user_id], unique: true)
  end
end

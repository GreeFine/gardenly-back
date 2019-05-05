# frozen_string_literal: true

class AddRoomsAndMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.uuid :uuid, default: -> { 'uuid_generate_v4()' }, null: false
      t.string :name

      t.timestamps
    end

    create_table :messages do |t|
      t.uuid :uuid, default: -> { 'uuid_generate_v4()' }, null: false
      t.uuid :user_id
      t.uuid :room_id
      t.string :content

      t.timestamps
    end

    create_table :rooms_users, id: false do |t|
      t.belongs_to :room, type: :uuid, index: true
      t.belongs_to :user, type: :uuid, index: true
    end

  end
end

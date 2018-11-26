class CreateModerators < ActiveRecord::Migration[5.2]
  def change
    create_table :moderators do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.timestamps
    end

    add_reference :moderators, :user, index: true
  end
end

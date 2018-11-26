class CreateGardenUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :garden_users do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false

      t.timestamps
    end

    add_reference :garden_users, :user, index: true
    add_reference :garden_users, :garden, index: true
  end
end

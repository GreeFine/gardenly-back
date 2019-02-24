class AddComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :content

      t.timestamps
    end

    add_column :comments, :user_id, :uuid
  end
end

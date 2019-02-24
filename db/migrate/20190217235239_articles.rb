class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :author
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end

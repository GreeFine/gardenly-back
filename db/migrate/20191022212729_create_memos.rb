class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :body

      t.belongs_to :user, type: :uuid, index: true

      t.timestamps
    end
  end
end

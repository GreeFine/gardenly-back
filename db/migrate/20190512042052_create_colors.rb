class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :name

      t.timestamps
    end
  end
end

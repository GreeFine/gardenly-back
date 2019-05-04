class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.string :name

      t.timestamps
    end

    add_reference :plants, :type, type: :uuid, index: true
  end
end

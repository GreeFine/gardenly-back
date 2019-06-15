class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      t.float :start, array: true
      t.float :end, array: true
      t.integer :key

      t.timestamps
    end
    remove_column :static_elements, :scale
  end
end

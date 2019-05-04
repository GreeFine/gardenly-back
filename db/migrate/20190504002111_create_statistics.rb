class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.integer :users_count
      t.integer :media_count
      t.integer :gardens_count
      
      t.timestamps
    end
  end
end

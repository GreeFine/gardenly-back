class AddNumberOfItemsInGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :items, :integer
  end
end

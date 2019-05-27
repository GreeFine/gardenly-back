class AddSlugToGarden < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :slug, :string
    add_index :gardens, :slug
  end
end

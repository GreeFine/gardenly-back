class FixTypeOnStaticElements < ActiveRecord::Migration[5.2]
  def change
    remove_column :static_elements, :type, :integer
    add_column :static_elements, :type, :string
  end
end

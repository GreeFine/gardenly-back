class AddDataFieldsToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :blossoming_start, :integer, array: true, default: []
    add_column :plants, :blossoming_end, :integer, array: true, default: []
    add_column :plants, :height_low, :integer
    add_column :plants, :height_high, :integer
    add_column :plants, :ph_range_low, :float
    add_column :plants, :ph_range_high, :float
    add_column :plants, :rusticity, :integer
    add_column :plants, :water_need, :integer
    add_column :plants, :sun_need, :integer
    add_column :plants, :color, :string, array: true, default: []
  end
end

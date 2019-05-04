class FixPlants < ActiveRecord::Migration[5.2]
  def change
    remove_column :plants, :symbol, :string
    remove_column :plants, :scientific_name, :string
    remove_column :plants, :species, :string
    remove_column :plants, :common_name, :string
    remove_column :plants, :location, :string
    remove_column :plants, :category, :string
    remove_column :plants, :family, :string
    remove_column :plants, :duration, :string
    remove_column :plants, :growth_habit, :string
    remove_column :plants, :native_status, :string
    remove_column :plants, :toxicity, :string
    remove_column :plants, :whole_data, :json
  end
end

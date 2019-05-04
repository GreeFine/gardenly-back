class AddStuffToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :symbol, :string, null: false
    add_column :plants, :scientific_name, :string, null: false
    add_column :plants, :species, :string, null: false
    add_column :plants, :common_name, :string
    add_column :plants, :location, :string
    add_column :plants, :category, :string
    add_column :plants, :family, :string
    add_column :plants, :duration, :string
    add_column :plants, :growth_habit, :string
    add_column :plants, :native_status, :string
    add_column :plants, :toxicity, :string
    add_column :plants, :whole_data, :json
  end
end

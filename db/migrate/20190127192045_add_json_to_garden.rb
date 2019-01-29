class AddJsonToGarden < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :data, :json
    add_column :gardens, :user_id, :uuid
  end
end

class AddPicturesAndAvatars < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :plants, :photo, :string
  end
end

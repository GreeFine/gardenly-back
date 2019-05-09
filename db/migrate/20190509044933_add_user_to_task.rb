class AddUserToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, type: :uuid, index: true
  end
end

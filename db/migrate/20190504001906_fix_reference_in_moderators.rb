class FixReferenceInModerators < ActiveRecord::Migration[5.2]
  def change
    remove_column :moderators, :user_id, :uuid
    add_reference :moderators, :user, type: :uuid, index: true
  end
end

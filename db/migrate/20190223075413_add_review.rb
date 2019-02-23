class AddReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.uuid :uuid, default: -> { "uuid_generate_v4()" }, null: false
      t.boolean :vote
    end

    add_column :reviews, :user_id, :uuid
    add_column :reviews, :article_id, :uuid
  end
end

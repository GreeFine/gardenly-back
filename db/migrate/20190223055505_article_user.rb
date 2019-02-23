class ArticleUser < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_id, :uuid
    remove_column :articles, :author_id
  end
end

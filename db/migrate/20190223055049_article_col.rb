class ArticleCol < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :author_id, :uuid
    remove_column :articles, :author
  end
end

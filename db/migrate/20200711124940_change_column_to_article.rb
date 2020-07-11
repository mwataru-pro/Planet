class ChangeColumnToArticle < ActiveRecord::Migration[5.2]
  def up
    change_column :articles, :article_content, :text, null: false, limit: 4294967295
  end

  def down
    change_column :articles, :article_content, :text, null: false
  end
end

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :admin_id, null: false
      t.string :article_title, null: false
      t.text :article_content, null: false
      t.string :article_image_id, null: false

      t.timestamps
    end
  end
end

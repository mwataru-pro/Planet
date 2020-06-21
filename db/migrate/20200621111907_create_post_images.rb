class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|

      t.string :user_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :image_id
      t.timestamps
    end
  end
end

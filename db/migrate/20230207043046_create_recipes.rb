class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :customer_id,       null: false
      t.integer :comment_id
      t.integer :like_id
      t.integer :tag_map_id
      t.integer :item_recipe_map_id
      t.string :title,              null: false
      t.string :body,               null: false

      t.timestamps
    end
  end
end

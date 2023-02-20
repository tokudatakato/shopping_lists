class CreateRecipeTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_taggings do |t|
      t.references :recipe, foreign_key: { on_delete: :cascade }, comment: "Recipeテーブルとの関連付け"
      t.references :hashtag, foreign_key: true, comment: "Hashtagテーブルとの関連付け"
      
      t.timestamps
    end
    add_index :recipe_taggings, [:recipe_id, :hashtag_id], unique: true, comment: "recipeに対して同じtagを複数つけられないよう設定"
  end
end

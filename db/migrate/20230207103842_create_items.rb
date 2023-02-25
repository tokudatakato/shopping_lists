class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :category_id,       null: false
      t.string :item_name,           null: false
      t.text :description
      t.integer :price
      t.boolean :is_stock, default: "true", null: false

      t.timestamps
    end
  end
end

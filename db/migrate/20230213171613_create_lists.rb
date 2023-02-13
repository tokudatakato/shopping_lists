class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :customer_id, null: :false
      t.integer :list_item_id
      t.string :list_name,    null: :false

      t.timestamps
    end
  end
end

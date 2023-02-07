class ChangeColumnToCustomerNull < ActiveRecord::Migration[6.1]
  def change
    def up
      change_column :customer, :nickname,:string, null: true # null: trueを明示する必要がある
    end

    def down
      change_column :customer, :nickname,:string, null: false
    end
  end
end

class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :item_id, null: false, foreign_key: true
      t.references :order_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null: false

      t.timestamps
    end
  end
end

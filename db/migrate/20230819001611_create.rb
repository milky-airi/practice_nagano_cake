class Create < ActiveRecord::Migration[6.1]
  def change

    create_table :order_details do |t|
      t.integer "item_id", null: false
      t.integer "order_id", null: false
      t.integer "price", null: false
      t.integer "quantity", null: false
      t.integer "making_status", null: false
      t.timestamps
    end

    create_table :orders do |t|
      t.integer "member_id", null: false
      t.string "post_code", null: false
      t.text "address", null: false
      t.string "name", null: false
      t.integer "shipping_fee", null: false
      t.integer "total_price", null: false
      t.integer "pay_method", null: false
      t.integer "status", null: false
      t.timestamps
    end

  end
end

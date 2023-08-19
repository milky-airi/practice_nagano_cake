class DropOrderAndOrderDetailsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_details
    drop_table :orders
  end
end

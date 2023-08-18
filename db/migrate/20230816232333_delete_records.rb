class DeleteRecords < ActiveRecord::Migration[6.1]
  def change
    drop_table :addresses
    drop_table :admins
    drop_table :cart_items
    drop_table :genres
    drop_table :items
    drop_table :members
    drop_table :order_details
    drop_table :orders

  end
end

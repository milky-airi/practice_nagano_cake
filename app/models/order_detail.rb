class OrderDetail < ApplicationRecord
  belongs_to :item_id
  belongs_to :order_id
end

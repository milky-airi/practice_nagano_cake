class CartItem < ApplicationRecord
  belongs_to :member_id
  belongs_to :item_id
end

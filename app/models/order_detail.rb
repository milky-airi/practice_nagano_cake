class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum making_status: { not_available: 0, waiting_for_makiing: 1, making: 2, made: 3 }
end

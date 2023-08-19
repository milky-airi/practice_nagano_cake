class Order < ApplicationRecord
  belongs_to :member
  has_many :order_details, dependent: :destroy

  enum pay_method: { credit_card: 0, transfer: 1 }

end

class Order < ApplicationRecord
  belongs_to :member_id
  has_many :order_details, dependent: :destroy
end

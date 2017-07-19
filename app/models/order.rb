class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  enum pay_type: {
    "Cash" => 0, 
    "Credit Card" => 1,
    "Check" => 2
  }
end

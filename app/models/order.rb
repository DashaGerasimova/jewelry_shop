class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  enum pay_type: {
    "Cash" => 0, 
    "Credit Card" => 1,
    "Check" => 2
  }
  enum status: {
    "Not staged" => 0, 
    "In progress" => 1,
    "Ready" => 2
  }
end

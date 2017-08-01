class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy

  enum pay_types: {
    cash: "Cash", 
    credit_card: "Credit Card",
    check: "Check"
  }
  enum statuses: {
    not_staged: "Not staged",
    in_progress: "In progress",
    ready: "Ready"
  }
end

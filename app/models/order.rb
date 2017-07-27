class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy

  after_create_commit :send_order_create_notification
  after_update_commit :send_order_status_update_notification

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

  def send_order_create_notification
    OrderMailer.order_create_notification(self).deliver!
  end

  def send_order_status_update_notification
    OrderMailer.order_update_status_notification(self).deliver!
  end
end

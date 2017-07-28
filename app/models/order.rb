class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy

  after_create_commit :send_order_create_notification
  after_update_commit :send_order_status_update_notification

  pay_types = [
    "Cash", 
    "Credit Card",
    "Check"
  ]
  statuses = [
    "Not staged",
    "In progress",
    "Ready"
  ]

  def send_order_create_notification
    OrderMailer.delay.order_create_notification(self)
  end

  def send_order_status_update_notification
    OrderMailer.delay.order_update_status_notification(self)
  end
end

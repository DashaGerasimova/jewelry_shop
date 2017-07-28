class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy

  after_create_commit :send_order_create_notification
  after_update_commit :send_order_status_update_notification

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

  def send_order_create_notification
    OrderMailer.delay.order_create_notification(self)
  end

  def send_order_status_update_notification
    OrderMailer.delay.order_update_status_notification(self)
  end
end

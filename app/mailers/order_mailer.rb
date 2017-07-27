class OrderMailer < ApplicationMailer
  default from: 'from@example.com'

  def order_create_notification(order)
    @order = order
    mail(to: order.email, subject: 'Your order was successfully created!')
  end

  def order_update_status_notification(order)
    @order = order
    mail(to: order.email, subject: 'Your order status was changed!')
  end
end

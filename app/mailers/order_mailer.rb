class OrderMailer < ApplicationMailer
  include Sidekiq::Mailer
  def order_create_notification(order)
    @order = order
    mail(to: order.email, subject: 'Your order was successfully created!')
  end

  def order_update_status_notification(order)
    @order = order
    mail(to: order.email, subject: 'Your order status was changed!')
  end
end

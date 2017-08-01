class OrderUpdateStatusNotification
  include Interactor
  include Sidekiq::Mailer

  def call
    OrderMailer.delay.order_update_status_notification(context.order)
  end
end

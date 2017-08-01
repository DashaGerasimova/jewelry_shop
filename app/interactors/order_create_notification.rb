class OrderCreateNotification
  include Interactor
  include Sidekiq::Mailer

  def call
    OrderMailer.delay.order_create_notification(context.order)
  end
end

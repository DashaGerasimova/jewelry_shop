class OrderDecorator < Draper::Decorator
  delegate_all

  def can_be_cancelled?
    status == Order.statuses[:not_staged]
  end
end

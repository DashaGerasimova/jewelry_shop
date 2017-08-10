class OrderDecorator < Draper::Decorator
  delegate_all

  def can_be_cancelled?
    if status == Order.statuses[:not_staged]
      return true
    else
      return false
    end
  end
end

class OrdersController < ApplicationController
  include CurrentCart   #for set_cart and sort_cart method
  expose_decorated :order
  expose(:orders) { Order.all }
  expose :order_products, from: :order

  expose(:cart) { set_cart }
  expose(:sorted_cart) { sort_cart }

  before_action :authorize_order

  def create
    order.user = current_user
    if order.save
      create_order_products_from_cart
      OrderCreateNotification.call(order: order)
    end
    respond_with order, location: profile_path
  end

  #update order.status
  def update
    if order.update(order_status)
      OrderUpdateStatusNotification.call(order: order)
    end
    respond_with order, location: orders_path
  end 

  def destroy
    order.destroy
    respond_with order, location: profile_path
  end

  private
    def authorize_order
      authorize order
    end

    def create_order_products_from_cart
      sorted_cart.each do |product_id, quantity|
        order_product = OrderProduct.new(product_id: product_id, order_id: order.id, cost: Product.find(product_id).price * quantity, quantity: quantity)   
        order_product.save
      end
    end

    def order_params
      params.require(:order).permit(:name, :phone_number, :email, :address, :pay_type)
    end
    def order_status
      params.require(:order).permit(:status)
    end
end

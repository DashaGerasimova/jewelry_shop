class OrdersController < ApplicationController
  include CurrentCart   #for set_cart and sort_cart method
  expose(:order)
  expose(:orders) { Order.all }
  expose(:order_products) { set_order_products }
  expose(:cart) { set_cart }
  expose(:sorted_cart) { sort_cart }

  def create
    order.user = current_user
    if order.save
      create_order_products_from_cart
    end
    respond_with order, location: root_path
  end

  def destroy
    order.destroy
    respond_with order, location: root_path
  end

  private
    def create_order_products_from_cart
      sorted_cart.each do |product_id, quantity|
        order_product = OrderProduct.new(product_id: product_id, order_id: order.id, cost: Product.find(product_id).price * quantity, quantity: quantity)   
        order_product.save
      end
    end

    def set_order_products
      order.order_products
    end

    def order_params
      params.require(:order).permit(:name, :phone_number, :email, :address, :pay_type)
    end
end

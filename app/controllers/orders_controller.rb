class OrdersController < ApplicationController
  include CurrentCart   #for set_cart method
  expose(:order)
  expose(:orders) { Order.all }
  expose(:order_products) { set_order_products }
  expose(:cart) { set_cart }

  def index #for admins
  end

  def show 
  end

  def new
  end

  def create
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
      cart.each do |product_id|
        order_product = OrderProduct.find_by(product_id: product_id)
        if order_product
          order_product.quantity += 1
        else
          order_product = OrderProduct.new(product_id: product_id, order_id: order.id, quantity: 1, cost: 1) 
        end
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

class OrderProductsController < ApplicationController
  include CurrentCart   #for set_cart method
  expose(:order) { set_order }
  expose(:product) { set_product }
  expose(:order_product) 
  expose(:cart) { set_cart }

  def index
  end

  def new
  end

  def create
    @order_product = OrderProduct.new(order_product_params)
    @order_product.save
    respond_with(@order_product)
  end

  def destroy
    @order_product.destroy
    respond_with(@order_product)
  end

  private
    def set_order
      Order.find(params[:order_id])
    end

    def set_product 
      Product.find(params[:product_id])
    end 

    def set_order_product
      order.order_product
    end

    def order_product_params
      params.require(:order_product).permit(:cost, :quantity, :product_id, :order_id)
    end
end

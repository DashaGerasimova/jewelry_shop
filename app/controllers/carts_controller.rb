class CartsController < ApplicationController
  expose(:product) { set_product }
  expose(:cart) { set_cart }

  def index
  end

  def new
  end

  def create
    cart << product.id
    redirect_to carts_path
  end

  def destroy
    cart.delete(product.id)
    redirect_to carts_path
  end

  private
    def set_product
      Product.find(params[:product_id])
    end 

    def set_cart
      session[:cart] || session[:cart] = []
    end
end

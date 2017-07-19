class CartsController < ApplicationController
  expose(:cart) { set_cart }

  def index
  end

  def new
  end

  def create
  end

  def destroy
    cart.destroy if cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_with cart, location: cart_items_path
  end

  private
    def set_cart
      cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] = cart.id
      cart
    end
end

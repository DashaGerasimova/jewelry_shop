class CartItemsController < ApplicationController
  expose(:cart) { set_cart }
  expose(:cart_item) 
  expose(:cart_items) { cart.cart_items }
  expose(:product) { set_product }

  def index
  end

  def new
  end

  def create
    cart_item = cart.add(product)
    cart_item.save
    respond_with cart_item, location: cart_items_path
  end

  def destroy
    cart_item.destroy
    respond_with cart_item, location: cart_items_path
  end

  private
    def set_cart
      cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] = cart.id
      return cart
    end

    def set_product
      Product.find(params[:product_id])
    end

    def set_cart_item
      CartItem.find(params[:id])
    end
end

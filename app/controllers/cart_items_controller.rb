class CartItemsController < ApplicationController
  expose(:product) { Product.find(params[:product_id]) }
  expose(:cart_items) { session[:cart_items] || session[:cart_items] = [] }

  # GET /cart_items
  # GET /cart_items.json
  def index
  end

  # GET /cart_items/new
  def new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    cart_items << product
    redirect_to cart_items_path
  end

  def destroy
    cart_items.delete_if {|elem| elem["id"] == product.id}
    redirect_to cart_items_path
  end

end

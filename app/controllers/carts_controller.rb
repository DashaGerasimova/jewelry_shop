class CartsController < ApplicationController
  include CurrentCart   #for set_cart method
  expose(:product) { set_product }
  expose(:cart) { set_cart }
  expose(:sorted_cart) { sort_cart }

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

    def sort_cart
      cart.inject(Hash.new(0)) { |quantity, product| quantity[product] += 1 ;quantity}
    end
end

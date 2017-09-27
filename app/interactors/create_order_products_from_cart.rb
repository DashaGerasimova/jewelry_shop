class CreateOrderProductsFromCart
  include Interactor

  def call
    context.cart.each do |product_id, quantity|
      order_product = OrderProduct.new(product_id: product_id, order_id: context.order.id, cost: Product.find(product_id).price * quantity, quantity: quantity)
      order_product.save
    end
  end
end

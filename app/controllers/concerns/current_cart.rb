module CurrentCart
  private 
    def set_cart
      session[:cart] || session[:cart] = []
    end
    def sort_cart
      cart.inject(Hash.new(0)) { |quantity, product| quantity[product] += 1 ;quantity}
    end
end

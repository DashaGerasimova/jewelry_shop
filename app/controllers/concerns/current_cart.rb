module CurrentCart
  private

    def set_cart
      session[:cart] || session[:cart] = []
    end

    def sort_cart
      cart.each_with_object(Hash.new(0)) { |product, quantity| quantity[product] += 1; }
    end
end

module CurrentCart
  private 
    def set_cart
      session[:cart] || session[:cart] = []
    end
end

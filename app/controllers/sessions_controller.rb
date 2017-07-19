class SessionsController < Devise::SessionsController
  before_action :delete_cart, only: [:destroy]

  private 
    def delete_cart
      CartItem.where(cart_id: session[:cart_id]).delete_all
      Cart.where(id: session[:cart_id]).delete_all
    end
end

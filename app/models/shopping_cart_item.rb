class ShoppingCartItem < ApplicationRecord
  acts_as_shopping_cart_item

  belongs_to :product
end

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add (product)
    item = cart_items.find_by(product_id: product.id)
    if item
      item.quantity += 1
    else
      item = cart_items.build(product_id: product.id) 
    end
    item
  end
end

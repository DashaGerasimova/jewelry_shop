require 'base64'
require 'aws-sdk'

class ProductsController < ApplicationController
  expose_decorated(:product)
  expose(:products) { Product.all.decorate }
  def create
    product.user = current_user
    
    product.save
    CreateImageForProduct.call(product: product, image: params[:image])
    respond_with product
  end

  def update
    product.update(product_params)
    CreateImageForProduct.call(product: product, image: params[:image])
    respond_with product
  end

  def destroy
    product.destroy
    respond_with product
  end

  private  
    # Never trust parameters from the scary internet, only allow the white list through.
    def set_find_sort_products
      Product.search(params[:search_term]).all.sort_by {|product| product.rating }.reverse
    end
    def product_params
      params.require(:product).permit(:name, :desc, :style, :size, :image, :price)
    end
end

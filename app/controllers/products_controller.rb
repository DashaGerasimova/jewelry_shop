require 'base64'

class ProductsController < ApplicationController
  expose :products, ->{ Product.all }
  expose :product
  
  def index
  end

  
  def show
  end

  def new
  end

  def edit
  end

  def create
    product.user_id = current_user.id

    product.save
    respond_with product
  end

  def update
    product.update(product_params)
    respond_with product
  end

  def destroy
    product.destroy
    respond_with product
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :style, :size, :image, :price)
    end
end

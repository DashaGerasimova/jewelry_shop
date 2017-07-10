require 'base64'

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end

  
  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'product was successfully created.'
      unless params[:image].empty?
        data = params[:image]
        image_data = Base64.decode64(data['data:image/png;base64,'.length .. -1])
        File.open("#{Rails.root}/public#{@product.id.to_s}", 'wb') do |f|
          f.write image_data
      end
    end
    else
      render :new 
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :style, :size, :image, :price)
    end
end

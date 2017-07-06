class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  

  def index
    @products = Product.all
  end

  
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'product was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
      if @product.update(product_params)
        redirect_to @product, notice: 'product was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /products/1
  # DELETE /products/1.json
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
      params.require(:product).permit(:name, :desc, :product_type, :size, :image, :price)
    end
end

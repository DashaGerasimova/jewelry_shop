class CartItemsController < ApplicationController
  expose(:product) { Product.find(params[:product_id]) }
  expose(:shopping_cart_items) { shopping_cart.shopping_cart_items}

  before_action :extract_shopping_cart

  # GET /cart_items
  # GET /cart_items.json
  def index

  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    session[:shopping_cart].add(product, product.price)
    redirect_to cart_items_path
    # respond_to do |format|
    #   if @cart_item.save
    #     format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
    #     format.json { render :show, status: :created, location: @cart_item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @cart_item.errors, status: :unprocessable_entity }
    #   end
    #end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
     def extract_shopping_cart
      shopping_cart_id = session[:shopping_cart_id]
      @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
      if session[:shopping_cart].nil?
        session[:shopping_cart] = ShoppingCart.create
      end
    end
    def cart_item_params
      params.fetch(:cart_item, {})
    end
end

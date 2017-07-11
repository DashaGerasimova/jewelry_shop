class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
  end

  def create
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @product, notice: 'Comment was successfully created.' 
    else
      flash.now[:alert] = "error"
    end    
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @product, notice: 'Comment was successfully updated.' 
    else
      flash.now[:alert] = "error"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @product, notice: 'Comment was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @product.comments.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:rating, :text)
    end
end

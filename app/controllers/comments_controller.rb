class CommentsController < ApplicationController 

  expose(:product) { Product.find(params[:product_id]) }
  expose(:comments)do
    product.comments
  end
  expose(:comment) do
    unless params[:id].nil?
      product.comments.find_by(params[:id])
    else
      product.comments.new(comment_params)
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    comment.user = current_user

    comment.save
    respond_with comment, location: comment.product
  end

  def update
    comment.update(comment_params)
    respond_with comment, location: comment.product
  end

  def destroy
    comment.destroy
    respond_with comment, location: comment.product
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:rating, :text)
    end
end

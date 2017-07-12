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
    comment.user_id = current_user.id

    if comment.save
      redirect_to product, notice: 'Comment was successfully created.' 
    else
      redirect_to product, notice: 'Comment wasnt successfully created.' 
    end    
  end

  def update
    if comment.update(comment_params)
      redirect_to product, notice: 'Comment was successfully updated.' 
    else
      redirect_to product, notice: 'Comment was successfully updated.' 
    end
  end

  def destroy
    comment.destroy
    redirect_to product, notice: 'Comment was successfully destroyed.' 
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:rating, :text)
    end
end

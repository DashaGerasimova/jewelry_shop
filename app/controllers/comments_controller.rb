class CommentsController < ApplicationController 

  expose(:product) { set_product }
  expose(:comments) { product.comments }
  expose :comment, scope: ->{ product.comments }
  
  expose(:answers) { comment.answers }

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

    def set_product
      Product.find(params[:product_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:rating, :text)
    end
end

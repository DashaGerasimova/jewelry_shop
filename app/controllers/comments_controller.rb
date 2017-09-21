class CommentsController < ApplicationController 
  expose :product
  expose :comments, from: :product
  expose :comment, scope: ->{ product.comments }
  
  expose :answers, from: :comment

  def create
    comment.user = current_user

    comment.save
    respond_with comment, location: product
  end

  def update
    comment.update(comment_params)
    respond_with comment, location: product
  end

  def destroy
    comment.destroy
    respond_with comment, location: product
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:rating, :text)
    end
end

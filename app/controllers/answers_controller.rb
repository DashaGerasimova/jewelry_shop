class AnswersController < ApplicationController
  
  expose(:comment) { set_comment }
  expose(:answer) { set_answer }

  expose(:answers) { comment.answers }

  def create
    answer.user = current_user

    answer.save
    respond_with answer, location: comment.product
  end

  def update
    answer.update(answer_params)
    respond_with answer, location: comment.product
  end

  def destroy
    answer.destroy
    respond_with answer, location: comment.product
  end

  private

    def set_comment
      Comment.find(params[:comment_id])
    end
    def set_answer
      unless params[:id].nil?
        comment.answers.find_by(id: params[:id])
      else
        comment.answers.new(comment_params)
      end
    end

    def answer_params
      params.require(:answer).permit(:text, :user_id, :comment_id)
    end
end

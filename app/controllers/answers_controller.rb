class AnswersController < ApplicationController
  expose :comment
  expose :answer, scope: -> { comment.answers }

  expose :answers, from: :comment

  before_action :authorize_answer

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

  def authorize_answer
    authorize answer
  end

  def answer_params
    params.require(:answer).permit(:text, :user_id, :comment_id)
  end
end

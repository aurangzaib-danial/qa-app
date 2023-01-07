class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def ask
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to slug_path(@question)
    else
      render :ask, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:subject_id, :title, :body)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end

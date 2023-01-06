class QuestionsController < ApplicationController
  def ask
    @question = Question.new
  end
end

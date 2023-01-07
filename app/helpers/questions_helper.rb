module QuestionsHelper
  def question_info(question)
    html = <<-HTML
      #{question.questioner.name}
      <span class="text-muted"> asked #{created_at_in_words(question)}</span>
    HTML
    html.html_safe
  end
end

module ApplicationHelper
  def title(text)
    text += ' - QA'
    content_for :title, text
  end

  def created_at_in_words(object)
    distance_of_time_in_words_to_now(object.created_at) + ' ago'
  end

  def tab_link_options(tab)
    active_options = {class: "nav-link active", "aria-current": "page"}
    if params[:tab] == tab || params[:tab].nil? && tab == "recent"
      active_options
    else
      {class: "nav-link"}
    end
  end
end

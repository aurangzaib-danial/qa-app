class ApplicationController < ActionController::Base
   def slug_path(object, options = {})
    case object.class.name
    when "Question"
      question_slug_path(object.id, object.slug, options)
    when "Subject"
      subject_slug_path(object.id, object.slug, options)
    end
  end
end

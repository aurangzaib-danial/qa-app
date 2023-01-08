class ApplicationController < ActionController::Base
   include ActionView::RecordIdentifier

   helper_method :slug_path

   include Pundit::Authorization

   def slug_path(object, options = {})
    case object.class.name
    when "Question"
      question_slug_path(object.id, object.slug, options)
    when "Subject"
      subject_slug_path(object.id, object.slug, options)
    end
  end
end

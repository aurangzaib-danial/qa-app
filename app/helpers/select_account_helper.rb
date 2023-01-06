module SelectAccountHelper
  def select_account_button(type)
    text = "Create #{type.capitalize}"
    options = {class: "btn btn-primary"}
    query_params = {account: type}
    if user_signed_in?
      button_to(users_select_account_path(query_params), options.merge(method: :patch)) { button_content(text) }
    else
      link_to text, new_user_registration_path(query_params), options
    end 
  end
end


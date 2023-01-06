Rails.application.routes.draw do
  root "main#index"


  devise_for(
    :users, 
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup"},
    controllers: { 
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions'
    }
  )
end

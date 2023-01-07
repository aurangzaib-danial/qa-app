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

  get "/questions/ask", to: "questions#ask", as: "ask_question"
  resources :questions, except: [:new, :show] do
    resources :votes, only: [:create, :destroy]
    scope module: :questions do
      resources :comments, only: [:create, :update, :destroy]
      resources :follows, only: [:create, :destroy]
    end
  end

  get "/questions/:id/:slug", to: "questions#show", as: "question_slug"
  get "/subjects/:id/:slug", to: "subjects#show", as: :subject_slug
end

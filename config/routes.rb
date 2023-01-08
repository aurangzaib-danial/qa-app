Rails.application.routes.draw do
  root "main#index"
  get "/search", to: "search#index"
  get "/followed", to: "follows#index"
  get "/settings", to: "settings#show"
  patch "/settings", to: "settings#update"

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
    resources :answers, only: [:create, :edit, :update, :destroy]
    resources :votes, only: [:create, :destroy]
    scope module: :questions do
      resources :comments, only: [:create, :update, :destroy]
      resources :follows, only: [:create, :destroy]
    end
  end

  get "/questions/:id/:slug", to: "questions#show", as: "question_slug"
  get "/subjects/:id/:slug", to: "subjects#show", as: :subject_slug

  resources :answers, only: [] do
    scope module: :answers do
      resources :comments, only: [:create, :update, :destroy]
      resources :follows, only: [:create, :destroy]
    end
  end

  resources :notifications, only: :index do
    collection do
      patch :mark_as_read
    end
  end
end

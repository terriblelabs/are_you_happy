AreYouHappy::Application.routes.draw do
  resources :moods, only: [:new, :create]
  resource :quote

  root "moods#new"
  resources :dashboard, only: [:index]
end

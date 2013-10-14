AreYouHappy::Application.routes.draw do
  resources :moods, only: [:new, :create]
  resource :quote

  root "moods#new"
end

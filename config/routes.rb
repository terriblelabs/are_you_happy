AreYouHappy::Application.routes.draw do
  resources :moods, only: [:new, :create]

  root "moods#new"
end

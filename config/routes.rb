Rails.application.routes.draw do
  get 'calendar/index'
  get 'calendar/callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'lists#index'
resources :genres
resources :lists
get "genre_search/:id", to: "lists#genre_search",as: 'genre_search'
end

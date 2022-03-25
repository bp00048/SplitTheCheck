Rails.application.routes.draw do
  resources :restaurants
  resources :restaurant

  root 'restaurants#index'

  get 'searchName', to: "restaurants#index"
  get 'searchState', to: "restaurants#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'user/summary' => 'summary#index'
  get 'favorites/update'
  devise_for :users
  resources :restaurants do
    resources :comments, only: [:create]
  end
  resources :users
  resources :restaurant
  resources :votes, only:[:create, :destroy]
  root 'restaurants#index'

  put '/restaurants/:id/yes', to: 'restaurants#yes', as: 'yes'
  put '/restaurants/:id/no', to: 'restaurants#no', as: 'no'

  get 'searchName', to: "restaurants#index"
  get 'searchLocation', to: "restaurants#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

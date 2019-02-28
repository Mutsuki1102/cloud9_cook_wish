Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'users/show'
  devise_for :users
  root to: "posts#lp"
  get '/posts/index', to: 'posts#index'
  get '/posts/calendar', to: 'posts#calendar'
  resources :posts, only: [:show, :edit, :destroy, :create, :new, :update]
  resources :users, only: [:show]
  resources :likes, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

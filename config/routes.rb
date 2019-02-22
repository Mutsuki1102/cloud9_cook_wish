Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "posts#lp"
  get '/posts/index', to: 'posts#index'
  get '/posts/calendar', to: 'posts#calendar'
  resources :posts, only: [:show, :edit, :destroy, :create, :new, :update]
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "posts#lp"
  get '/posts/index', to: 'posts#index'
  get '/posts/calendar', to: 'posts#calendar'
  resources :posts, only: [:show, :edit, :destroy, :create, :new, :update] do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]

  post   '/like/:post_id', to: 'likes#like',   as: :like
  delete '/like/:post_id', to: 'likes#unlike', as: :unlike

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

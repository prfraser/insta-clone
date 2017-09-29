Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :posts
  resources :tags, only: [:index, :show]
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

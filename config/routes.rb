Rails.application.routes.draw do

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'following' => 'following#show'
  get 'follower' => 'follower#show'

	resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :categories
  resources :words
  resources :relationships,       only: [:create, :destroy, :show]
end

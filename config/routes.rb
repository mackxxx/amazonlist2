Rails.application.routes.draw do
  get 'rankings/want'
  root to: "toppages#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/desire', to: 'rankings#desire'
  resources :users, only: [:index, :show, :create, :edit, :update] 
  resources :items, only: [:show, :index], param: :code do
    resources :wants, only: [:create, :destroy]
    resources :desires, only: [:create, :destroy]
  end
end
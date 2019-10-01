Rails.application.routes.draw do
  root to: "toppages#index"
  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  get 'login', to: 'sessions#destroys'
  get 'signup', to: 'users#new'
  resources :users, only:[:show, :create, :edit, :update] 
end
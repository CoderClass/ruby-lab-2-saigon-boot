Rails.application.routes.draw do
  get 'sessions/login'
  get 'new_login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'log_out' => 'sessions#destroy'
  root 'welcome#index'
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

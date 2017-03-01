Rails.application.routes.draw do

  resources :tribes
  resources :huts
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [] do
    get '/huts', to: "huts#index_by_user"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

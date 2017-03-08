Rails.application.routes.draw do

  resources :huts

  resources :tribes
  resources :huts
  devise_for :users
  root to: 'pages#home'


  resources :users, only: [] do
  get '/huts', to: "huts#index_by_user"
  get '/tribes', to: "tribes#index_by_user"
  get '/profile', to: "pages#profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  mount Attachinary::Engine => "/attachinary"
end

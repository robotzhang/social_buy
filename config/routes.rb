SocialBuy::Application.routes.draw do
  root :to => 'application#index'
  get 'logout' => 'users#logout'
  resources :users do
    member do
      get "stores"
      post "contacts"
    end
  end
  resources :stores
  resources :themes
  resources :contacts
  resources :links
  get '/auth/:provider/callback', to: 'users#create'
end

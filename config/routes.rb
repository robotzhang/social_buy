SocialBuy::Application.routes.draw do
  root :to => 'application#index'
  get 'logout' => 'users#logout'
  resources :users do
    member do
      get "stores"
    end
  end
  resources :stores
  resources :themes
  get '/auth/:provider/callback', to: 'users#create'
end

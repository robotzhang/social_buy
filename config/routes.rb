SocialBuy::Application.routes.draw do
  root :to => 'application#index'
  get 'logout' => 'users#logout'
  resources :users, :stores
  get '/auth/:provider/callback', to: 'users#create'
end

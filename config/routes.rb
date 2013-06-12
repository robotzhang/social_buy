SocialBuy::Application.routes.draw do
  root :to => 'application#index'
  resources :users, :stores
  get '/auth/:provider/callback', to: 'users#create'
end

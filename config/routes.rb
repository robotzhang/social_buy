SocialBuy::Application.routes.draw do
  root :to => 'application#index'
  resources :users, :stores
end

Rails.application.routes.draw do
  scope module: 'v1' do
    post '/signup', to: 'users#create', as: 'signup'
    
    resources :products, only: [:index]
    resources :subscriptions, only: [:create]
    resource :profile, only: [:show]
  end
end

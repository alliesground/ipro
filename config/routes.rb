Rails.application.routes.draw do
  scope module: 'v1' do
    post '/signup', to: 'users#create', as: 'signup'
  end
end

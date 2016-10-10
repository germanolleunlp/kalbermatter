Kalbermatter::Application.routes.draw do
  root 'welcome#home'
  get '/home', to: 'welcome#home', as: 'home'
  get '/about', to: 'welcome#about', as: 'about'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :orders do
    resources :product_configurations
  end

  resources :products do
    resources :ingredient_configurations
  end

  resources :ingredients
end

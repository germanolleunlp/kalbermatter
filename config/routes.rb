Kalbermatter::Application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
end

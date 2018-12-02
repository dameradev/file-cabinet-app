Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  resources :documents
  authenticated :user do
    root to: "documents#index", as: "authenticated_root"
  end
  root to: 'welcome#home'

   
end

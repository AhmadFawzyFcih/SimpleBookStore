Rails.application.routes.draw do
  
  root :to => "books#index"

  devise_for :users , :controllers => { registrations: 'registrations' , omniauth_callbacks: 'users/omniauth' }

  resources :books do
    member do
      get :delete
    end
  end
  
  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

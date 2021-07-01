Rails.application.routes.draw do
  devise_for :users
  resources :coins do
    collection { post :import }
  end
  resources :coins do
    collection do
      delete :clean
    end
  end

  namespace :admin do
    resources :coins
  end

  root 'coins#index'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

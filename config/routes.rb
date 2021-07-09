Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
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
    resources :articles 
    resources :coins
  end

  resources :articles do
    member do
      post 'like' => 'articles#like'
      post 'unlike' => 'articles#unlike'
    end
  end

  namespace :admin do
    resources :coins do
      collection do
        post :bulk_update
      end
    end
  end

  resources :member
  root 'coins#index'
  post 'member/become_member' => 'member#become_member'
  post 'member/cancel_member' => 'member#cancel_member'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

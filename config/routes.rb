Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users#new_guest'
  end

  root to: "tops#index"
  resources :shops do
    resources :reviews
    resources :clips
    collection do
      get 'search'
    end
    member do
      get 'map'
    end
  end
  resources :users do
    resources :clips
    resources :histories
  end

end

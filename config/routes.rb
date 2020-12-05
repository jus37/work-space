Rails.application.routes.draw do
  devise_for :users

  root to: "shops#index"
  resources :shops do
    resources :reviews
    resources :clips
    resources :histories
    collection do
      get 'search'
    end
  end
  resources :users do
    resources :clips
    resources :histories
  end

end

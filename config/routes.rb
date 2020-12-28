Rails.application.routes.draw do
  devise_for :users

  root to: "tops#index"
  resources :shops do
    resources :reviews
    resources :clips
    collection do
      get 'search'
      get 'map'
    end
  end
  resources :users do
    resources :clips
    resources :histories
  end

end

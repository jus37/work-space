Rails.application.routes.draw do
  devise_for :users

  root to: "shops#index"
  resources :shops do
    resources :reviews
    collection do
      get 'search'
    end
  end
  resources :users

end

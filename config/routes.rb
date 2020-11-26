Rails.application.routes.draw do
  devise_for :users

  root to: "shops#index"
  resources :shop

end

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :farms do
    resources :foods
  end
end

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  devise_scope :user do
    resources :farms do
      resources :foods
    end
  end
end

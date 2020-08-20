Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :farms, except: %i[index show] do
    resources :foods, except: %i[index show]
  end

  resources :logistics_companies, except: %i[index show]

  resources :food_banks, only: [:new, :create]

  scope module: :visitors do
    scope module: :resources do
      get '/farms', to: 'farms#index', as: 'farms_list'
      get '/farms/:farm_id', to: 'farms#show', as: 'farm_show'
      get '/farms/:farm_id/foods', to: 'foods#index', as: 'farm_food_items'
      get '/farms/:farm_id/foods/:food_id', to: 'foods#show', as: 'farm_food_item'

      get '/logistics', to: 'logistics#index', as: 'logistics_list'
      get '/logistics/:logistics_company_id', to: 'logistics#show', as: 'logistics_show'

      get '/food_banks', to: 'food_banks#index', as: 'food_banks_list'
    end
  end
end

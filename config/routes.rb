Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :suppliers, except: %i[index show] do
    resources :foods, except: %i[index show]
  end

  resources :logistics_companies, except: %i[index show]

  resources :distributors, except: %i[index show]

  scope module: :visitors do
    get '/suppliers', to: 'suppliers#index', as: 'suppliers_list'
    get '/suppliers/:supplier_id', to: 'suppliers#show', as: 'supplier_show'
    get '/suppliers/:supplier_id/foods', to: 'foods#index', as: 'supplier_food_items'
    get '/suppliers/:supplier_id/foods/:food_id', to: 'foods#show', as: 'supplier_food_item'

    get '/logistics', to: 'logistics#index', as: 'logistics_list'
    get '/logistics/:logistics_company_id', to: 'logistics#show', as: 'logistics_show'

    get '/distributors', to: 'distributors#index', as: 'distributors_list'
    get '/distributors/:distributors_id', to: 'distributors#show', as: 'distributor_show'
  end
end

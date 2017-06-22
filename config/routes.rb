Rails.application.routes.draw do
  root to: 'declarations#index'
  resources :declarations do
    collection do
      get :add
    end
  end
end

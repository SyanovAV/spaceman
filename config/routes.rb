Rails.application.routes.draw do
  root 'description#index'
  get 'description/index'

  resources :items do
    resource :folders, shallow: true
    resources :requests, shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

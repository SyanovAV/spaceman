Rails.application.routes.draw do
  root 'description#index'
  get 'description/index'
  get 'item/quick_show', to: 'items#quick_show'

  resources :items do
    resources :requests, shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'description/index'

  resource :requests
  resource :collections
  root 'description#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :providers, only: [:index]

  resources :machines, only: [:index, :create, :update, :destroy]

  resources :runscripts, only: [:index, :create, :update, :destroy]
end

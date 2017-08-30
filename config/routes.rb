Rails.application.routes.draw do

  resources :images, only: [:index, :create, :destroy]
  resources :statuses
  resources :applications

  root 'applications#index'
end

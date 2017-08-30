Rails.application.routes.draw do

  resources :statuses
  resources :applications

  root 'applications#index'
end

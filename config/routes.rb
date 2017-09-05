Rails.application.routes.draw do

  resources :emails
  resources :statuses
  resources :applications

  root 'applications#index'
end

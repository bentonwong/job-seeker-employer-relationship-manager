Rails.application.routes.draw do

  resources :companies
  resources :emails
  resources :statuses
  resources :applications

  root 'applications#index'
end

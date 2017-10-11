Rails.application.routes.draw do

  resources :companies
  resources :emails
  resources :statuses
  resources :applications

  root 'applications#index'

  get '/search', to: 'companies#search'
  post '/search', to: 'companies#glassdoor_search'
  
end

Rails.application.routes.draw do
  root 'teams#index'

  resources :teams
  resources :tasks
  resources :mutants
end

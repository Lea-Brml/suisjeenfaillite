Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#index'

  get '/conditions-generales-utilisation', to: 'static_pages#cgu'

  get '/politique-utilisation-donnees', to: 'static_pages#politique'


  resources :passif

  resources :banque

  resources :facture

  resources :user

  resources :personne

  resources :societe


  resources :message


  resources :users do
    resources :passif
    resources :banque
    resources :facture
    resources :personne
    resources :societe
  end


end

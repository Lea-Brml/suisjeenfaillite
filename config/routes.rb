Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#index'

  resources :passif

  resources :banque

  resources :facture

  resources :user


  resources :users do
    resources :passif
    resources :banque
    resources :facture
  end


end

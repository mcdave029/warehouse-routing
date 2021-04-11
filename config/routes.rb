# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'destinations#index'

  resources :destinations, except: %i[show new edit]
  resources :products, except: %i[show new edit]
end

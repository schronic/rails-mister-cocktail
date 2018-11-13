Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :create, :new, :destroy] do
    resources :doses, only: [:show, :index, :new, :create]
    resources :reviews, only: [:show, :index, :new, :create]
  end
  resources :doses, only: [:destroy]
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
end

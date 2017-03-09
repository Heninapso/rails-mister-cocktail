Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create, :update] do
    resources :doses, only: [:create, :show]
  end

  resources :doses, only: [:destroy]


  # get 'cocktails', to: 'cocktails#index'

  # get 'cocktails/show', to: 'cocktails#show'

  # get 'cocktails/new', to: 'cocktails#new'
  # post 'cocktails', to: 'cocktails#create'

  # get 'doses/new', to: 'cocktails/:id/doses#new'
  # post 'doses', to: 'cocktails/:id/doses#create'

  # delete 'doses/destroy', to: 'doses#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

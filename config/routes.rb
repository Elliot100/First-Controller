Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 8 routes total
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#upate'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  
  resources :users do
    resources :pets, only: [:index, :new]
  end

  resources :pets, only: [:create, :show, :update, :destroy]
end

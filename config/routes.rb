Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users
  get 'user/:id', to: 'user#show' , as: 'user_show'
  get 'users', to: 'user#index' ,as:'users'
  # get '/recipes', to: 'recipes#index'
  # get '/recipe/new', to: 'recipes#create', as: 'new_recipe' #new so verb ni get
  # post '/recipes', to: 'recipes#create' ,as: 'store_recipe'
  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id', to: 'recipes#update', as: 'update_recipe'
  # get '/recipes/id', to: 'recipe#show', as: 'show_recipe'
  # delete '/recipe/:id' , to: 'recipes#destroy', as: 'drop_recipe'

  # resouce method
  resources :recipes do #saves time .. rather than typin it all .. all indivigual routes just write this
    member do
      post 'like'
    end
  end
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

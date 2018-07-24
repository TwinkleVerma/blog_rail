Rails.application.routes.draw do
  get 'articles/new'
  get 'welcome/index'
  get 'articles/alert'
  resources :users do 
    get 'login', on: :collection
    get 'logout', on: :collection
    post 'auth_user', on: :collection
  end
  resources :images
  resources :categories
  resources :likes
  resources :articles do
  	resources :comments
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

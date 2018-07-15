Rails.application.routes.draw do

namespace :admin do
  resources :dashboard, only: [:index]
end

resource :session, only: [:new, :create, :destroy]
resources :users, only: [:new, :create]

resources :products do

  resources :reviews, only: [:create, :update, :destroy]

end

resources :reviews, shallow: true, only: [] do
  resources :likes, only: [:create, :destroy]
end






  #Routes to Prouct model
  # get "/products/new", to: "products#new", as: :new_product
  # post "/products", to: "products#create", as: :products
  # get "/products/:id", to: "products#show", as: :product
  # get "/products", to: "products#index"
  # delete "/products/:id", to: "products#destroy"
  # get "/products/:id/edit", to: "products#edit", as: :edit_product
  # patch "products/:id", to: "products#update"
  # put "products/:id", to: "products#update"


  get('/', {to: 'home#index', as: 'home'})
  get('/contact', {to: 'contact#index'})
  post('/contact_submit', {to: 'contact#create'})
  get('/about', {to: 'about#index'})

end

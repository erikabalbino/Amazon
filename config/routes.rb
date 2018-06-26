Rails.application.routes.draw do

  get('/', {to: 'home#index', as: 'home'})

  get('/contact', {to: 'contact#index'})

  post('/contact_submit', {to: 'contact#create'})

  get('/about', {to: 'about#index'})

end

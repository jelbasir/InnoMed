Rails.application.routes.draw do

  resources :users
  resources :prescriptions
  resources :appointments
  resources :schedules
  resources :remoteconsultations
  resources :consultations,only: [:index,:new, :create, :destroy]


  get 'password_resets/new'

  get 'password_resets/edit'

  resources :patients, :doctors do
   resources :appointments, only: [:index,:new, :create, :destroy, :payment]
  end
  resources :doctors do
   resources :schedules
  end
  
  
  #get 'sessions/new'

  #get 'static_pages/home'

 # get 'static_pages/about'

  #get 'static_pages/contact'
  #root 'static_pages#home'
  
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get   '/doctors', to: 'static_pages#doctors'
  get  '/signup/doctors',  to: 'doctors#new'
  post '/signup/doctors',  to: 'doctors#create'
  get  '/signup',  to: 'patients#new'
  post '/signup',  to: 'patients#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :patients
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :patients, path: 'patients', controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations'
  }

  devise_for :doctors, path: 'doctors', controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }

  resources :appointments
  resources :schedules
  resources :remoteconsultations

  get 'password_resets/new'
  get 'password_resets/edit'

  resources :patients, :doctors do
    resources :appointments, only: %i[index new create destroy payment]
  end

  resources :doctors do
    resources :schedules
  end

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/doctors', to: 'static_pages#doctors'

  get  '/signup',  to: 'patients#new'
  post '/signup',  to: 'patients#create'

  resources :rooms, only: %i[index show], param: :doctor_id
  resources :room_messages, only: :create

  resources :password_resets, only: %i[new create edit update]
  # resources :conversations do
  #   resources :messages
  # end

  namespace :doctor do
    resources :rooms, only: %i[index show], param: :patient_id, controller: '/rooms'
    resources :patients
  end
end

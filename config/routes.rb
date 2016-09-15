Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}, :skip => :registerable
  as :user do
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'users/registrations#update', :as => 'user_registration'
  end
  resources :type_of_rooms
  resources :room_properties
  resources :multimedia_rooms
  resources :multimedia_hotels
  resources :multimedia
  resources :reservations, only: [:new, :create, :show, :edit, :update, :cancel]
  resources :rooms
  resources :hotel_places, only: [:index, :show, :edit, :update]
  resources :users
  resources :settings

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

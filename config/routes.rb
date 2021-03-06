Rails.application.routes.draw do
  resources :carts, only: [:index, :show]
  resources :orders do
    collection do
      get '/new/', to: 'orders#new', :as => 'new_order'
      post '/new', to: 'orders#create', as: 'new_order_create'
      put '/new', to: 'orders#create'
      patch '/new', to: 'orders#create'
    end
  end
  devise_for :users, controllers: {sessions: 'users/sessions'}, :skip => :registerable
  as :user do
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'users/registrations#update', :as => 'user_registration'
  end
  resources :type_of_rooms, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :room_properties, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :multimedia_rooms
  resources :multimedia_hotels
  resources :multimedia
  resources :reservations do
    collection do
      get '/get_room', to: 'reservations#get_room', as: 'get_room'
    end
  end
  resources :rooms do
    collection do
      get '/add_photos/:id', to: 'rooms#add_photos', as: 'add_photos'
      post '/update_photos/:id', to: 'rooms#update_photos', as: 'update_photos'
      put '/update_photos/:id', to: 'rooms#update_photos'
      patch '/update_photos/:id', to: 'rooms#update_photos'
    end
  end

  resources :hotel_places, only: [:index, :show, :edit, :update] do
    collection do
      get '/add_photos/:id', to: 'hotel_places#add_photos', as: 'add_photos'
      post '/update_photos/:id', to: 'hotel_places#update_photos', as: 'update_photos'
      put '/update_photos/:id', to: 'hotel_places#update_photos'
      patch '/update_photos/:id', to: 'hotel_places#update_photos'
    end
  end
  resources :users
  resources :settings

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

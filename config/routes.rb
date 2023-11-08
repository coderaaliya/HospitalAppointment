Rails.application.routes.draw do
  get 'order_items/index'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/show'
  get 'carts/show'
  resources :products
  get 'assitants/dashboard'
  get 'doctors/dashboard'
  get 'pages/index'
  get 'pages/about'
  get 'pages/service'
  get 'pages/feature'
  get 'pages/404'
  get 'doctors/showall'
 
devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}

  resources :appointments, only: [:new, :create]
  resources :patients do
    get 'book_appointment', on: :member
    delete 'destroy_appointment/:appointment_id', to: 'patients#destroy_appointment', on: :member, as: :destroy_appointment
  end

  namespace :patients do
    resource :appointments, only: [:new, :create]
  end
  resources :appointments, only: [:show]
  resources :doctors do
  get 'dashboard', on: :member
  end
  
	resources :assistants do
	  get 'dashboard', on: :member
	end
  resources :cart_items, only: [:create, :update, :destroy] do
    member do
      put 'decrease_quantity'
      put 'increase_quantity'
    end
  end

  resource :cart, only: [:show, :update_quantities] do
    member do
      post 'checkout'
      get 'checkout'
    end
  end

  resources :orders, only: [:index, :show] do
    resources :order_items, only: [:index]
  end
  

  # Defines the root path route ("/")
   root "pages#index"
end

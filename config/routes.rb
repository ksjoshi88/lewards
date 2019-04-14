Rails.application.routes.draw do

  resources :products
  resources :profiles
  resources :purchases, only: [:new, :create, :index]
  resources :rewards,   only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'}

end

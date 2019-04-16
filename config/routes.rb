Rails.application.routes.draw do

  resources :products
  resources :profiles
  resources :purchases, only: [:new, :create, :index]
  resources :rewards,   only: [:index]

  get 'reward_reports', to: 'rewards#reward_reports', as: 'show_reward_reports'
  get 'get_rewards_distribution', to: 'rewards#get_rewards_distribution'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth'
  }

end

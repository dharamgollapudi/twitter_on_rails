Rails.application.routes.draw do
  devise_for :users, controllers: { 
  	omniauth_callbacks: 'omniauth_callbacks'
  }

  root 'welcome#index'

  get 'twitter/search', to: 'twitter#search'
  get 'twitter/home_timeline', to: 'twitter#home_timeline'
  get 'twitter/following', to: 'twitter#following'
  get 'twitter/followers', to: 'twitter#followers'
  get 'twitter/favorites', to: 'twitter#favorites'
  get 'twitter/(:query)', to: 'twitter#search', as: 'twitter_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

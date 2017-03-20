Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'twitter/search', to: 'twitter#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :teams do
    resources :players
  end
  root 'fixtures#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

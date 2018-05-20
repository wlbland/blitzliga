Rails.application.routes.draw do
  get 'welcome/index'
  resources :teams do
    resources :players
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

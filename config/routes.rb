Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :teams do
    resources :players
  end
  root 'welcome#index'

  resources :fixtures, only: [:show, :index]

   get '/future', to: 'fixtures#future', as: 'future'

   get "/pages/:page" => "pages#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

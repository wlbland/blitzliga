Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # , controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations", passwords: "passwords" }

  # get '/auth/:provider/callback', to: 'sessions#create'


  resources :teams do
    resources :players
  end

  resources :players do
  end

  root 'fixtures#next'


  resources :fixtures, only: [:show, :index] do
    get "next", :on => :collection
    get "past", :on => :collection
    get "future", :on => :collection
    get "results", :on => :collection

    resources :teams,  only: [:show]
  end

  resources :team_fixtures, only: [:show, :index] do
    resources :team_scores
  end


  get "/pages/:page" => "pages#show"
  get 'welcome/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

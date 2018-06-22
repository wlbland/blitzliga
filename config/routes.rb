Rails.application.routes.draw do



  # get '/auth/:provider/callback', to: 'sessions#create'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  ActiveAdmin.routes(self)

  resources :seasons, only: [:show, :index] do
    resources :teams, only: [:show, :index] do
      get "table", :on => :collection
    end
  end

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
    get "overdue", :on => :collection

    resources :teams,  only: [:show]
  end

  resources :team_fixtures, only: [:show, :index] do
    resources :team_scores
  end


  get "/pages/:page" => "pages#show"
  get 'welcome/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

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

  resources :players, only: [:top_scorers] do
    get "top_scorers", :on => :collection
  end

  root 'fixtures#next'
  get "fixtures/:id/add_photos", to: "fixtures#add_photos", as: "add_fixture_photos"
  patch "fixtures/:id/add_photos", to: "fixtures#add_photos", as: "add"

  resources :fixture_photos, only: [:show, :index]

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

  resources :team_scores, only: [:show] do
    resources :goals
  end

  get "/pages/:page" => "pages#show"
  get 'welcome/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

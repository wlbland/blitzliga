class FixturePhotosController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index]

  skip_after_action :verify_authorized, only: [:index]


  def index
    @photos = policy_scope(FixturePhoto)
  end

end

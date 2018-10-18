class FixturePhotosController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index, :show]

  skip_after_action :verify_authorized, only: [:index, :show]


  def index
    @photos = policy_scope(FixturePhoto).order(created_at: :desc)
  end

  def show
  	@fixture_photo = FixturePhoto.find(params[:id])
    authorize @fixture_photo
  end

end

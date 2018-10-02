class FixturePhotosController < ApplicationController
  def index
    @photos = policy_scope(FixturePhoto)
  end
end

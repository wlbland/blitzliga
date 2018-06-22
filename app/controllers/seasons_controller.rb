class SeasonsController < ApplicationController

  skip_before_action :authenticate_user!

  skip_after_action :verify_authorized, only: [:show, :index]


    def show
    end

    def index
    end

end

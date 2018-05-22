class WelcomeController < ApplicationController
  def index
    @fixtures = Fixture.all
  end
end

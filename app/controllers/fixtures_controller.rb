class FixturesController < ApplicationController

  skip_after_action :verify_authorized, only: [:future, :past, :next, :results]


  def index
    # @fixtures = Fixture.all
    @fixtures = policy_scope(Fixture)
  end


  def show
    @fixture = Fixture.find(params[:id])
    authorize @fixture
  end

  # def new
  #   @fixture = Fixture.new
  # end

  # def edit
  #   @fixture = Fixture.find(params[:id])
  # end

  # def create
  #   @fixture = Fixture.new(team_params)
  #   if @fixture.save
  #     redirect_to @fixture
  #   else
  #     render 'new'
  #   end
  # end

  # def update
  #   @fixture = Fixture.find(params[:id])
  #   if @fixture.update(fixture_params)
  #     redirect_to @fixture
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @fixture = Fixture.find(params[:id])
    authorize @fixture
    @fixture.destroy
    redirect_to fixtures_path
  end

  def future
    @fixtures = policy_scope(Fixture).future.order(time: :asc)
  end

  def past
    @fixtures = policy_scope(Fixture).past.order(time: :desc)
  end

  def next
    @fixtures = Fixture.future.next.order(time: :asc)
  end

  def results
    @fixtures = Fixture.result_recorded.order(time: :desc)
  end


  private

    def fixture_params
      params.require(:team, :fixture).permit(time)
    end
end

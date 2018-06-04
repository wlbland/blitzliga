class TeamScoresController < ApplicationController

  def new
    @team_fixture = TeamFixture.find(params[:team_fixture_id])
    @fixture = @team_fixture.fixture
    @team_score = TeamScore.new(team_fixture_id: @team_fixture.id)
    authorize(@team_score)
  end

  def create
    # @team_fixture = TeamFixture.find(params[:team_fixture_id])
    # score = TeamScore.new(team_fixture: @team_fixture)
    # @team_score =  params[:total_goals])
    # @team_score = team_score.new(team_score_params)
    # authorize(@team_score)
    # if @team_score.save
    #   redirect_to fixture_path(@team_fixture.fixture)
    # else
    #   render 'new'
    # end
    # @team_fixture = TeamFixture.find(params[:team_fixture_id])
    @team_score = TeamScore.new(team_score_params)
    @team_score.team_fixture = TeamFixture.find(params[:team_fixture_id])
    authorize(@team_score)
    if @team_score.save
      redirect_to fixture_path(@team_score.team_fixture.fixture)
    else
      render :new
    end
  end

  private

#CHECK
  def team_score_params
    params.require(:team_score).permit(:team_fixture_id, :total_goals)
  end

end

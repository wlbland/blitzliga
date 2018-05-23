class TeamScoresController < ApplicationController
  # def new
  #   @team_fixture = TeamFixture.find(params[:team_fixture_id])
  #   @fixture = @team_fixture.fixture
  #   @team_score = TeamScore.new
  # end

  # def create
  #   # @team_fixture = TeamFixture.find(params[:team_fixture_id])
  #   # score = TeamScore.new(team_fixture: @team_fixture)
  #   # @team_score =  params[:total_goals])
  #   @team_score = TeamScore.new(team_score_params)
  #   if @team_score.save
  #     redirect_to fixture_path(@team_fixture.fixture)
  #   else
  #     render 'new'
  #   end
  # end

  private

#CHECK
  def team_score_params
    params.require(:team_score).permit(:team_fixture_id, :total_goals)
  end

end

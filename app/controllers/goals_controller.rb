class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    @team_score = TeamScore.find(params[:team_score_id])
    authorize(@goal)
  end

  def create
    @team_score = TeamScore.find(params[:team_score_id])
    @goal = @team_score.goals.create(goal_params)
    authorize @goal
    if @goal.save
      redirect_to results_fixtures_path
    else
      render :new
    end
  end


  def destroy
    @team_score = TeamScore.find(params[:team_score_id])
    @goal = @team_score.goals.find(params[:id])
    authorize @goal
    @goal.destroy
    redirect_to results_fixtures_path
  end


  private

    def goal_params
      params.require(:goal).permit(:player_id, :team_score_id)
    end

end

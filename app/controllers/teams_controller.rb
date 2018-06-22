class TeamsController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  skip_before_action :authenticate_user!, only: [:index, :show, :table]

  skip_after_action :verify_authorized, only: [:table]


  def index
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(params[:id])
    authorize(@team)
  end

  def new
    @team = Team.new
    authorize(@team)
  end

  def edit
    @team = Team.find(params[:id])
    authorize(@team)
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def table
    @season = Season.find(params[:season_id]) if params[:season_id]
    @teams = policy_scope(Team).sort {|a,b| a.goal_difference(@season) <=> b.goal_difference(@season) }
    .sort {|a,b| a.points(@season) <=> b.points(@season) }.reverse
  end

  # def update
  #   @team = Team.find(params[:id])
  #   if @team.update(team_params)
  #     redirect_to @team
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @team = Team.find(params[:id])
  #   @team.destroy
  #   redirect_to teams_path
  # end


  private

    def team_params
      params.require(:team).permit(:name)
    end

end

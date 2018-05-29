class TeamsController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(params[:id])
    authorize(@team)
  end

  # def new
  #   @team = Team.new
  # end

  # def edit
  #   @team = Team.find(params[:id])
  # end

  def create
    @team = Team.new(team_params)
    authorize @team
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
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

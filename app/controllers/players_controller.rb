class PlayersController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # def new(team = nil)

  skip_before_action :authenticate_user!, only: [:top_scorers]

  skip_after_action :verify_authorized, only: [:top_scorers]

  def new
    @player = Player.new
    @team = Team.find(params[:team_id])
    authorize(@player)
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.create(player_params)
    authorize @player
    if @player.save
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

  def update
    @player = Player.find(params[:id])
    authorize @player
    if @player.update(player_params)
      redirect_to team_path(@player.team)
    else
      render 'edit'
    end
  end


  def destroy
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
    authorize @player
    @player.destroy
    redirect_to team_path(@team)
  end

  def toggle_registered
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
    authorize @player
    @player.toggle(:registered).save
  end

  def top_scorers
    @season = Season.find(params[:season_id]) if params[:season_id]
    @players = Player.all.sort {|a,b| a.goals_scored <=> b.goals_scored }.reverse
  end


  private

    def player_params
      params.require(:player).permit(:first_name, :last_name, :team_id, :registered)
    end

end

class PlayersController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def new(team = nil)
    @player = Player.new(team: team)
    authorize(@player)
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.create(player_params)
    authorize @player
    redirect_to team_path(@team)
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


  private

    def player_params
      params.require(:player).permit(:first_name, :last_name, :registered, :team)
    end

end

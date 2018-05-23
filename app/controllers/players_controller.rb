class PlayersController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # def create
  #   @team = Team.find(params[:team_id])
  #   @player = @team.players.create(player_params)
  #   redirect_to team_path(@team)
  # end

  # def destroy
  #   @team = Team.find(params[:team_id])
  #   @player = @team.players.find(params[:id])
  #   @player.destroy
  #   redirect_to team_path(@team)
  # end

  private

    def player_params
      params.require(:player).permit(:first_name, :last_name)
    end

end

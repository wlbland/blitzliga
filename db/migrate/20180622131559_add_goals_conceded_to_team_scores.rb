class AddGoalsConcededToTeamScores < ActiveRecord::Migration[5.1]
  def change
    add_column :team_scores, :goals_conceded, :integer
  end
end

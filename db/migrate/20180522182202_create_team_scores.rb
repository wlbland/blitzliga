class CreateTeamScores < ActiveRecord::Migration[5.1]
  def change
    create_table :team_scores do |t|
      t.references :team_fixture, foreign_key: true
      t.integer :total_goals
      t.timestamps
    end
  end
end

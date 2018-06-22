class AddOutcomeToTeamFixtures < ActiveRecord::Migration[5.1]
  def change
    add_column :team_fixtures, :outcome, :integer
  end
end

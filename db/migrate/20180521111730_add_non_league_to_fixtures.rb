class AddNonLeagueToFixtures < ActiveRecord::Migration[5.1]
  def change
    add_column :fixtures, :non_league, :boolean, default: :false
  end
end

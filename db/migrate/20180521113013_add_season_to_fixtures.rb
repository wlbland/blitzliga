class AddSeasonToFixtures < ActiveRecord::Migration[5.1]
  def change
    add_reference :fixtures, :season, foreign_key: true
  end
end

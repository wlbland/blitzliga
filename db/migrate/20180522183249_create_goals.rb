class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.references :player
      t.references :team_score
      t.timestamps
    end
  end
end

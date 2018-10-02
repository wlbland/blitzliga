class AddBligaDisplayToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :bliga_display, :boolean
  end
end

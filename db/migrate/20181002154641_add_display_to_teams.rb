class AddDisplayToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :display, :boolean
  end
end

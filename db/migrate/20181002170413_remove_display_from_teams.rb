class RemoveDisplayFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :display, :boolean
  end
end

class AddCaptainToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :captain, :boolean, default: :false
    add_reference :players, :user, foreign_key: true
  end
end

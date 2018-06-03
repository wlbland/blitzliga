class AddCodeToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :code, :string
    add_index :players, :code, unique: true
  end
end

class AddPhotographerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photographer, :boolean
  end
end

class AddUniqueIndexToVenues < ActiveRecord::Migration[5.1]
  def change
    add_index :venues, [:name, :pitch], unique: true
  end
end

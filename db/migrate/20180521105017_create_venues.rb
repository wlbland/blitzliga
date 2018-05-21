class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :pitch


      t.timestamps
    end

    add_reference :fixtures, :venue, foreign_key: true
  end
end

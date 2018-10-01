class CreateFixturePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :fixture_photos do |t|
      t.references :fixture, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end

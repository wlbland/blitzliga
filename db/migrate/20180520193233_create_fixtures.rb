class CreateFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :fixtures do |t|
      t.time :time
      t.timestamps
    end
  end
end

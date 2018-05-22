class CreateFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :fixtures do |t|
      #changed to datetime from time
      t.datetime :time
      t.timestamps
    end
  end
end

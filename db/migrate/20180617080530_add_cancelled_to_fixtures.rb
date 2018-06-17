class AddCancelledToFixtures < ActiveRecord::Migration[5.1]
  def change
    add_column :fixtures, :cancelled, :boolean, default: :false
  end
end

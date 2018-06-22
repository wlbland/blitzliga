class AddVoidToFixtures < ActiveRecord::Migration[5.1]
  def change
    add_column :fixtures, :void, :boolean, default: :false
  end
end

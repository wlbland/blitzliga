class ChangeFixtureTimeToDateTime < ActiveRecord::Migration[5.1]
  def change
    def self.up
    change_column :fixtures, :time, :datetime
    end

    def self.down
    change_column :fixtures, :time, :time
    end
  end
end

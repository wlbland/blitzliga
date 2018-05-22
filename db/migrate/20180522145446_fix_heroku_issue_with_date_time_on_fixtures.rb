class FixHerokuIssueWithDateTimeOnFixtures < ActiveRecord::Migration[5.1]
  def change
    def up
      remove_column :fixtures, :time
      add_column :fixtures, :time, :datetime
    end

    def down
      remove_column :fixtures, :time
      add_column :fixtures, :time, :time
    end
  end
end

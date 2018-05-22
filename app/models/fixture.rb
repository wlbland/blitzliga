class Fixture < ApplicationRecord
  has_many :team_fixtures, dependent: :destroy
  has_many :teams, through: :team_fixtures
  has_one :team_score
  belongs_to :venue
  belongs_to :season

  # scope :for_team, ->(team) { where(team_fixture: team.team_fixtures).order(time: :desc) }

  scope :current_month, -> { where(time: (DateTime.now.beginning_of_month .. DateTime.now.end_of_month)) }

  scope :for_season, ->(season_number) { where(season: Season.find_by(number:season_number)) }

  scope :past, ->{ where("time < ?", Time.now) }

  scope :future, ->{ where("time > ?", Time.now) }

  scope :next, ->{ where("time < ?", Time.now + 7.days) }


  def match_day_number
    # find all of unique matchdays for a given season
    season_fixtures = Fixture.for_season(self.season.number)
    unique_dates = []
    # find all of the unique date times, convert the date times to dates and then push each unique dates into an array
    season_fixtures.distinct.pluck(:time).each do |datetime|
        unique_dates << datetime.to_date
    end
    unique_dates.uniq!
    unique_dates.sort!
    (unique_dates.index(self.time.to_date) + 1)
  end

  def future
    @fixtures = Fixture.future
  end

end

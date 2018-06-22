class Fixture < ApplicationRecord
  has_many :team_fixtures, dependent: :destroy
  has_many :teams, through: :team_fixtures
  # check this line
  has_many :team_scores, through: :team_fixtures
  belongs_to :venue
  belongs_to :season

  alias_attribute :display_name, :id

  # scope :for_team, ->(team) { where(team_fixture: team.team_fixtures).order(time: :desc) }

  scope :valid, -> { where(cancelled: false)}

  scope :void, -> { where(void: true)}

  scope :not_void, -> { where(void: false)}

  scope :league, -> { where(non_league: false)}

  scope :current_month, -> { where(time: (DateTime.now.beginning_of_month .. DateTime.now.end_of_month)) }

  scope :for_season, ->(season_number) { where(season: Season.find_by(number: season_number)) }

  scope :for_season_object, ->(season) { where(season: season) }

  scope :past, ->{ where("time < ?", Time.now) }

  scope :future, ->{ where("time > ?", Time.now) }

  scope :next, ->{ where("time < ?", Time.now + 14.days) }

  scope :result_recorded, -> { joins(:team_scores).distinct }

  scope :no_result, -> { includes(:team_scores).where(team_scores: {id:nil}) }

  scope :for_team, ->(team) {
    joins(:team_fixtures).group("fixtures.id").merge(TeamFixture.for_team(team))
  }

  # scope :all_team_scores_for_team, -> (team) {
  #   # joins(:team_fixture).group("team_scores.id").
  #   joins(:team_scores).group("team_scores.id").merge(Fixture.for_team(team))
  # }

 # fix tomorrow
  # scope :scores_for_game, ->(team) {
  #   joins(:team_scores).group("fixtures.id").merge(TeamFixture.for_team(team))
  # }



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

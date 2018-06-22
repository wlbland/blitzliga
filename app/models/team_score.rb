class TeamScore < ApplicationRecord
  belongs_to :team_fixture
  has_many :goals, dependent: :destroy
  has_one :fixture, :through => :team_fixture

  validates :total_goals, presence: true

  alias_attribute :display_name, :id

  after_create :add_outcome_to_team_fixtures, :add_goals_conceded
  after_update :add_outcome_to_team_fixtures, :add_goals_conceded

  scope :for_season_object, -> (season) {
    joins(:team_fixture).merge(TeamFixture.for_season_object(season))
  }

  scope :for_team, -> (team) {
    joins(:team_fixture).merge(TeamFixture.for_team(team))
  }

  # scope :all_team_scores_for_team, -> (team) {
  #   # joins(:team_fixture).group("team_scores.id").
  #   joins(:fixture).group("team_scores.id").merge(Fixture.for_team(team))
  # }

  # scope :all_team_scores_for_team, -> (team) {
  #   # joins(:team_fixture).group("team_scores.id").
  #   joins(:fixture).group("team_scores.id").merge(Fixture.all_team_scores_for_team(team))
  # }


  # scope :for_and_against_team, -> (team) {
  #   joins(:team_fixture).merge(TeamFixture.for_and_against_team(team))
  # }

  def add_goals_conceded
    if self.fixture.team_fixtures.length == 2
      # opposition_team_fixture.team_score.update_column(:goals_conceded, self.total_goals)
      # self.update_column(:goals_conceded, opposition_goals_scored)
      if opposition_team_fixture.try(:team_score)
        opposition_team_fixture.try(:team_score).update_column(:goals_conceded, self.total_goals)
        self.update_column(:goals_conceded, opposition_goals_scored)
      end
    end
  end

  def add_outcome_to_team_fixtures
    unless team_scores_not_recorded_for_both_teams
      if match_drawn
        team_fixture.update(outcome: 1)
        self.opposition_team_fixture.update(outcome: 1)
      elsif match_won
        team_fixture.update(outcome: 2)
        self.opposition_team_fixture.update(outcome: 0)
      elsif match_lost
        team_fixture.update(outcome: 0)
        self.opposition_team_fixture.update(outcome: 2)
      end
    end
  end


  def match_drawn
    total_goals == self.opposition_goals_scored
  end

  def match_won
    total_goals > self.opposition_goals_scored
  end

  def match_lost
    total_goals < self.opposition_goals_scored
  end


  # def fixture
  #   team_fixture.fixture
  # end

  def team
    team_fixture.team
  end

  def opposition_team_fixture
    if team_fixture == self.fixture.team_fixtures[0]
      self.fixture.team_fixtures[1]
    else self.fixture.team_fixtures[0]
    end
  end

  def opposition_goals_scored
    opposition_team_fixture.team_score.total_goals
  end

  def team_scores_not_recorded_for_both_teams
    self.fixture.team_scores.length <2
  end

end

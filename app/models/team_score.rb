class TeamScore < ApplicationRecord
  belongs_to :team_fixture
  has_many :goals, dependent: :destroy

  validates :total_goals, presence: true

  alias_attribute :display_name, :id

  after_create :add_outcome_to_team_fixtures
  after_update :add_outcome_to_team_fixtures

  scope :for_season_object, -> (season) {
    joins(:team_fixture).merge(TeamFixture.for_season_object(season))
  }

  scope :for_team, -> (team) {
    joins(:team_fixture).merge(TeamFixture.for_team(team))
  }


  def add_outcome_to_team_fixtures
    unless self.fixture.team_scores.length <2
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


  def fixture
    team_fixture.fixture
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


end

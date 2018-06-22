class TeamFixture < ApplicationRecord
  belongs_to :team
  belongs_to :fixture
  has_one :team_score, dependent: :destroy

  validate :maximum_of_two, :on => :create

  alias_attribute :display_name, :id

  enum outcome: { defeat: 0, draw: 1, victory: 2}

  scope :for_fixture, -> (fixture) { where(fixture: fixture) }

  scope :for_team, -> (team) { where(team: team) }

  # scope :for_and_against_team, -> (team) { joins(:fixture).merge(Fixture.all).where(team: team) }

  scope :victories, -> { where(outcome: 2) }

  scope :draws, -> { where(outcome: 1) }

  scope :defeats, -> { where(outcome: 0) }

  scope :for_season_object, -> (season) {joins(:fixture).merge(Fixture.for_season_object(season)) }


  def maximum_of_two
    if self.fixture.team_fixtures.size >= 2
      errors.add(:base, "A fixture can only have two team fixtures")
    end
  end

  # def points_earned
  #   # find the other team fixture associated with this game
  #   opposition_fixture = self.fixture.team_fixtures[0] == self ? self.fixture.team_fixtures[1] : self.fixture.team_fixtures[0]
  #   # compare the team_scores for the other team
  #   opposition_goals = opposition_fixture.team_score.total_goals
  #   self_goals = self.team_score.total_goals
  #   # if the other team scored the same amount of goals, assign 1 point
  #   # if the other team scored fewer goals, assign 3 points
  #   # else assign 0 points
  #   if opposition_goals == self_goals
  #     1
  #   elsif opposition_goals < self_goals
  #     3
  #   else
  #     0
  #   end
  # end

end

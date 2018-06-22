class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :team_fixtures
  has_many :fixtures, through: :team_fixtures

  validates :name, presence: true, uniqueness: true,
    length: { maximum: 20 }

  scope :has_registered_players, -> {joins(:players)}


  def games_played(season)
    fixtures.not_void.league.result_recorded.for_season_object(season).length
  end

  def victories(season)
    TeamFixture.for_season_object(season).for_team(self).victories.length
  end

  def draws(season)
    TeamFixture.for_season_object(season).for_team(self).draws.length
  end

  def defeats(season)
    TeamFixture.for_season_object(season).for_team(self).defeats.length
  end

  def goals_scored(season)
    TeamScore.for_season_object(season).for_team(self).sum(:total_goals)
  end

  def goals_conceded(season)
    Fixture.for_team(self).team_scores.sum(:total_goals) - self.goals_scored(season)
  end


  def points(season)
    ( self.victories(season) * 3 ) + ( self.draws(season) )
  end

end

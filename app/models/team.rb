class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :team_fixtures
  has_many :fixtures, through: :team_fixtures

  validates :name, presence: true, uniqueness: true,
    length: { maximum: 20 }

  scope :has_registered_players, -> {joins(:players)}

  scope :bl_display, -> { where("display = ?", true) }


  def games_played(season)
    # Fixture.not_void.league.result_recorded.for_season_object(season).for_team(self).length
    ( victories(season) + draws(season) + defeats(season) )
  end

  def victories(season)
    TeamFixture.for_season_object(season).not_void.for_team(self).victories.length
  end

  def draws(season)
    TeamFixture.for_season_object(season).not_void.for_team(self).draws.length
  end

  def defeats(season)
    TeamFixture.for_season_object(season).not_void.for_team(self).defeats.length
  end

  def goals_scored(season)
    TeamScore.for_season_object(season).not_void.for_team(self).sum(:total_goals)
  end

  def goals_conceded(season)
    TeamScore.for_season_object(season).not_void.for_team(self).sum(:goals_conceded)
  end

  def goal_difference(season)
    goals_scored(season) - goals_conceded(season)
  end

  def points(season)
    ( self.victories(season) * 3 ) + ( self.draws(season) )
  end

end

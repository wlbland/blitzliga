class TeamFixture < ApplicationRecord
  belongs_to :team
  belongs_to :fixture
  has_one :team_score

  # scope :has_result, -> { joins(:team_score)}

  # scope :has_result, -> {where('id IN (SELECT DISTINCT(team_fixture_id) FROM team_score')}

  # def with_results
  #   @team_fixtures = Fixture.left_outer_joins(:team_fixture).where( contacts: { id: nil } )
  # end

end

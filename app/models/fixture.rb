class Fixture < ApplicationRecord
  has_one :team_fixture

  scope :for_team, ->(team) { where(team_fixture: team.team_fixtures).order(time: :desc) }

  scope :current_month, -> { where(time: (DateTime.now.beginning_of_month .. DateTime.now.end_of_month)) }


end

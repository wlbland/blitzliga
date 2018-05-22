class TeamScore < ApplicationRecord
  belongs_to :team_fixture
  has_many :goals
end

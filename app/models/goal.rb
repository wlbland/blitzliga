class Goal < ApplicationRecord
  belongs_to :team_score
  belongs_to :player

  scope :for_team_score, -> (team_score) {where(team_score: team_score)}


end

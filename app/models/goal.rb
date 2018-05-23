class Goal < ApplicationRecord
  belongs_to :team_score
  belongs_to :player
end

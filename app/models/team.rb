class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :team_fixtures
  has_many :fixtures, through: :team_fixtures

  validates :name, presence: true, uniqueness: true,
    length: { maximum: 20 }
end

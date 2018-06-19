class TeamScore < ApplicationRecord
  belongs_to :team_fixture
  has_many :goals

  alias_attribute :display_name, :team_fixture

end

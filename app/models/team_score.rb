class TeamScore < ApplicationRecord
  belongs_to :team_fixture
  has_many :goals, dependent: :destroy

  alias_attribute :display_name, :id

end

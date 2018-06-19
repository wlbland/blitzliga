class Season < ApplicationRecord
  has_many :fixtures
  validates :number, presence: true, uniqueness: true

  alias_attribute :display_name, :number

end

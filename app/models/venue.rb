class Venue < ApplicationRecord
  has_many :fixtures

  validates :name, presence: true, uniqueness: true
end

class Season < ApplicationRecord
  has_many :fixtures
  validates :number, presence: true, uniqueness: true
end

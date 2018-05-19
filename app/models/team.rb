class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  validates :name, presence: true, uniqueness: true,
                    length: { maximum: 20 }
end

class Season < ApplicationRecord
  has_many :fixtures
  validates :number, presence: true, uniqueness: true

  alias_attribute :display_name, :number


  def self.most_recent
    Season.order("number DESC").first
  end

end

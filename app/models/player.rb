class Player < ApplicationRecord

  # include ActiveModel::Dirty

  belongs_to :team
  belongs_to :user, optional: true
  has_many :goals

  validates :code, uniqueness: true

  scope :registered, -> { where("registered = ?", true) }
  scope :unregistered, -> { where("registered = ?", !true) }
  scope :for_team, ->(team) { where(team: team.id) }

  alias_attribute :display_name, :last_name


  # define_attribute_methods :registered

  # def initialize
  #   @name = nil
  # end

  # def registered
  #   @registered
  # end

  # def registered=(val)
  #   registered_will_change! unless val == @registered
  #   @registered = val
  # end

  # def save
  #   # do persistence work

  #   changes_applied
  # end

  # def reload!
  #   # get the values from the persistence layer

  #   clear_changes_information
  # end

  # def rollback!
  #   restore_attributes
  # end


end

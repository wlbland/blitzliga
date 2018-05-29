class PlayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    #only allow team captains or admins to create new players
    # record.team.user == user
    true
  end

  def update?
    user_is_admin?
  end

private
  def user_is_admin?
    user.admin?
  end

end

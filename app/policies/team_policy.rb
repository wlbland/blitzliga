class TeamPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope
    end

  end

  def create?
    #only allow admins to create new teams
    user.admin
  end

end

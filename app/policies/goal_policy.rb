class GoalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    (user.referee || user.admin)
  end

  def create?
    (user.referee || user.admin)
  end

  def destroy?
    (user.referee || user.admin)
  end


end

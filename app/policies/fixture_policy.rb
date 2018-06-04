class FixturePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def next?
    true
  end

  def create?
    user.admin
  end

  def overdue?
    (user.referee || user.admin) && record.time < Time.now && record.team_scores == []
  end

end

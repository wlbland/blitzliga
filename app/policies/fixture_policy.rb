class FixturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end



  def next?
    true
  end

end

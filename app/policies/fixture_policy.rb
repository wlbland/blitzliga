class FixturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end



  def next?
    true
  end

  def display_result_form
    user.referee || user.admin
  end

end

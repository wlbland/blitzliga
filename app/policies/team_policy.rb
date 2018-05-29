class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true
  end


  def create?
    #only allow admins to create new teams
    user_is_admin?
  end

  def update?
    user_is_admin? || (user_is_captain? && user_is_on_selected_team?)
  end

  private

  def user_is_admin?
    user.admin?
  end

  def user_is_captain?
    user.player.captain == true
  end

  def user_is_on_selected_team?
    user.player.team == record
  end

end

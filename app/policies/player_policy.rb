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
    user.player.team == record.team
  end

end

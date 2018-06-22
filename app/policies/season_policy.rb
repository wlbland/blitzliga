class PlayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


private
  # def user_is_admin?
  #   user&.admin?
  # end

  # def user_is_captain?
  #   user&.player&.captain == true
  # end


end

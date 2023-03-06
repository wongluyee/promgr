class GoalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.is_manager?
        scope.all
      else
      scope.where(user: user)
      end
    end
  end


  def create?
    true
  end

  def update?
    true
  end


end

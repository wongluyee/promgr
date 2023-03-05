class GoalsController < ApplicationController

  def index
    @goals = policy_scope(Goal)
    @goal = Goal.new

  end

end

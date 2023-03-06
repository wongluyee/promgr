class GoalsController < ApplicationController

  def index

    @goals = policy_scope(Goal)
    authorize @goals
    @goal = Goal.new

  end


  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    # @usertask = UserTask.new
    # @usertask.task_id = @task.id
    # if current_user.is_manager?
    #   @usertask.user_id = params[:task][:user_id]
    # else
    #   @usertask.user_id = current_user.id
    # end
    authorize @goal
    if @goal.save
      redirect_to user_goals_path
    else
      @goals = policy_scope(Goal)
      render "goals/index", status: :unprocessable_entity
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:title, :description)
  end

end

class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task)
    @user = current_user
  end

  def new
    @task = Task.new
    @users = User.all
    # render partial: 'tasks/addtask', locals: { task: @task }
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    # @usertask = UserTask.new
    # @usertask.task_id = @task.id
    # if current_user.is_manager?
    #   @usertask.user_id = params[:task][:user_id]
    # else
    #   @usertask.user_id = current_user.id
    # end

    authorize @task
    if @task.save
      redirect_to users_path
    else
      render "users/dashboard", status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    authorize @task

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render "tasks/edittaskform", status: :unprocessable_entity
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    authorize @task
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:task_title, :description, :due_date, user_ids: [])
  end
end

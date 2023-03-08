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
    authorize @task

    if @task.save
      client = Slack::Web::Client.new
      client.auth_test
      client.chat_postMessage(channel: '#general', text: task_added_notification(@task))
      redirect_to users_path
    else
      render "users/dashboard", status: :unprocessable_entity, locals: { timesheet_new: Timesheet.new }
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

  def task_added_notification(task)
    assignee = []
    task.users.each do |user|
      assignee << user.name
    end
    due_date = task.due_date.strftime("%a %b %e at %l:%M %p")
    <<~TEXT
      :exclamation: *New task added*
      Title: #{task.task_title}
      Due date: #{due_date}
      #{assignee.join(', ')} please check it and contact your manager if you have any questions.
    TEXT
  end

  def task_params
    params.require(:task).permit(:task_title, :description, :status, :due_date, user_ids: [])
  end
end

class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @users = policy_scope(User)
    @user = current_user

    # To display "Tasks Done" donut pie chart
    @tasks_done = Task.where(status: "done").count
    @all_tasks = Task.all.count
    @tasks_status = Task.group(:status).count

    # To display "Team overtime" bar chart
  end
end
